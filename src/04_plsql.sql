-- PL/SQL

-- textual del enunciado: cuando un estudiante queda inscrito en un grupo, ese grupo tiene que ser del mismo programa 
-- y del mismo periodo que su matrícula. Con las FK que hay, Oracle solo verifica que el grupo y la matrícula existan, pero no que coincidan.


-- Cada fila es una inscripción, y al lado tienes el programa y el periodo de la matrícula y los del grupo. 
-- En las 24 filas, programa_matricula siempre es igual a programa_grupo, y periodo_matricula siempre es igual a periodo_grupo, 
-- porque los datos se armaron con cuidado, basicamente para que coincidieran.

-- el problema aparece cuando: Intenta insertar esta inscripción incorrecta. Mete la matrícula MAT001 (PROG001, 2026-1) 
-- en el grupo 20003 (PROG002, 2026-2), pues oracle deja sin avisar nada, pero pues en teoria no estaria correcto


-- TRIGGERS

-- Trigger: trg_validate_enrollment_group (módulo Materias y grupos)
-- Funcionalidad: antes de inscribir una matrícula en un grupo (INSERT en enrollments_groups),
-- valida dos reglas del enunciado que las llaves foráneas no pueden garantizar:
--   1. El grupo debe pertenecer al mismo programa y al mismo periodo académico de la matrícula.
--   2. El estudiante solo puede estar en un grupo por cada materia dentro de una misma matrícula.
-- Si alguna regla no se cumple, cancela la inscripción y muestra un mensaje de error.
CREATE OR REPLACE TRIGGER trg_validate_enrollment_group
BEFORE INSERT ON enrollments_groups
FOR EACH ROW
DECLARE
    v_enrollment_program enrollments.program_program_id%TYPE;
    v_enrollment_term    enrollments.academic_term_academic_term_id%TYPE;
    v_group_program      groups.program_subject_program_program_id%TYPE;
    v_group_term         groups.academic_term_academic_term_id%TYPE;
    v_group_subject      groups.program_subject_subject_subject_id%TYPE;
    v_count              NUMBER;
BEGIN
    -- Programa y periodo de la matrícula que se quiere inscribir
    SELECT program_program_id, academic_term_academic_term_id
    INTO v_enrollment_program, v_enrollment_term
    FROM enrollments
    WHERE enrollment_id = :NEW.enrollment_enrollment_id;

    -- Programa, periodo y materia del grupo
    SELECT program_subject_program_program_id, academic_term_academic_term_id, program_subject_subject_subject_id
    INTO v_group_program, v_group_term, v_group_subject
    FROM groups
    WHERE nrc = :NEW.group_nrc;

    -- Regla 1: mismo programa y mismo periodo
    IF v_enrollment_program <> v_group_program OR v_enrollment_term <> v_group_term THEN
        RAISE_APPLICATION_ERROR(-20001, 'El grupo ' || :NEW.group_nrc ||
            ' no corresponde al programa o periodo de la matricula ' || :NEW.enrollment_enrollment_id);
    END IF;

    -- Regla 2: la matrícula no puede estar ya inscrita en otro grupo de la misma materia
    SELECT COUNT(*)
    INTO v_count
    FROM enrollments_groups eg
    JOIN groups g ON g.nrc = eg.group_nrc
    WHERE eg.enrollment_enrollment_id = :NEW.enrollment_enrollment_id
      AND g.program_subject_subject_subject_id = v_group_subject;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'La matricula ' || :NEW.enrollment_enrollment_id ||
            ' ya esta inscrita en un grupo de la materia ' || v_group_subject);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'La matricula ' || :NEW.enrollment_enrollment_id ||
            ' o el grupo ' || :NEW.group_nrc || ' no existen');
END;
/

-- FUNCIONES

-- Función: fn_final_grade (módulo Calificaciones)
-- Funcionalidad: calcula la nota definitiva de un estudiante en una materia, es decir, de una
-- inscripción (matrícula en un grupo). Suma cada nota multiplicada por el porcentaje de su
-- actividad y divide entre 100, como pide el enunciado: "la calificación definitiva de la materia
-- se calculará a partir de las notas de las actividades y sus porcentajes".
-- Parámetros:
--   p_group_nrc     NRC del grupo.
--   p_enrollment_id Id de la matrícula inscrita en ese grupo.
-- Retorna: la definitiva redondeada a dos decimales (entre 0.0 y 5.0), o NULL si la inscripción
-- todavía no tiene notas registradas.
-- Ejemplo: SELECT fn_final_grade('10001', 'MAT001') FROM dual;  -- 4.23
CREATE OR REPLACE FUNCTION fn_final_grade (
    p_group_nrc     IN groups.nrc%TYPE,
    p_enrollment_id IN enrollments.enrollment_id%TYPE
) RETURN NUMBER
IS
    v_final_grade NUMBER;
BEGIN
    -- SUM sin filas devuelve NULL, así que una inscripción sin notas retorna NULL
    SELECT ROUND(SUM(ag.grade * a.percentage) / 100, 2)
    INTO v_final_grade
    FROM activities_grades ag
    INNER JOIN activities a ON a.activity_id = ag.activities_activity_id
    WHERE ag.enrollment_group_group_nrc = p_group_nrc
      AND ag.enrollment_group_enrollment_enrollment_id = p_enrollment_id;

    RETURN v_final_grade;
END fn_final_grade;
/

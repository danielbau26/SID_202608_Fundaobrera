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

-- PROCEDIMIENTOS

-- Procedimiento: pr_register_withdrawal (módulo Estado académico)
-- Funcionalidad: registra el retiro de un estudiante de una matrícula. Cambia el estado a
-- 'retirado' y guarda la fecha y el motivo, como pide la historia "Registrar retiro de un estudiante".
-- Validaciones:
--   1. La fecha y el motivo son obligatorios.
--   2. La matrícula debe existir.
--   3. Solo se puede retirar una matrícula que esté en estado 'cursando'.
-- Parámetros:
--   p_enrollment_id     Id de la matrícula.
--   p_withdrawal_date   Fecha del retiro.
--   p_withdrawal_reason Motivo del retiro.
-- No hace COMMIT; quien lo llama decide si confirma (COMMIT) o deshace (ROLLBACK).
-- Ejemplo: EXEC pr_register_withdrawal('MAT006', DATE '2026-09-10', 'Dificultades económicas');
CREATE OR REPLACE PROCEDURE pr_register_withdrawal (
    p_enrollment_id     IN enrollments.enrollment_id%TYPE,
    p_withdrawal_date   IN enrollments.withdrawal_date%TYPE,
    p_withdrawal_reason IN enrollments.withdrawal_reason%TYPE
)
IS
    v_status enrollments.status_name%TYPE;
BEGIN
    -- Validación 1: fecha y motivo obligatorios
    IF p_withdrawal_date IS NULL OR TRIM(p_withdrawal_reason) IS NULL THEN
        RAISE_APPLICATION_ERROR(-20020, 'La fecha y el motivo del retiro son obligatorios');
    END IF;

    -- Validación 2: si la matrícula no existe, este SELECT lanza NO_DATA_FOUND
    SELECT status_name
    INTO v_status
    FROM enrollments
    WHERE enrollment_id = p_enrollment_id
    FOR UPDATE;

    -- Validación 3: solo se retiran matrículas que se están cursando
    IF v_status <> 'cursando' THEN
        RAISE_APPLICATION_ERROR(-20021, 'La matricula ' || p_enrollment_id ||
            ' no se puede retirar porque esta en estado ' || v_status);
    END IF;

    UPDATE enrollments
    SET status_name       = 'retirado',
        withdrawal_date   = p_withdrawal_date,
        withdrawal_reason = p_withdrawal_reason
    WHERE enrollment_id = p_enrollment_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20022, 'La matricula ' || p_enrollment_id || ' no existe');
END pr_register_withdrawal;
/

-- FUNCIONES

-- Función: fn_attendance_percentage (módulo Asistencia)
-- Funcionalidad: calcula el porcentaje de asistencia de un estudiante en una materia, es decir, de una
-- inscripción (matrícula en un grupo), como pide el enunciado: "porcentaje de asistencia de los estudiantes".
-- Divide las clases a las que asistió ('S') entre las clases registradas y multiplica por 100.
-- Parámetros:
--   p_group_nrc     NRC del grupo.
--   p_enrollment_id Id de la matrícula inscrita en ese grupo.
-- Retorna: el porcentaje redondeado a dos decimales (entre 0 y 100), o NULL si la inscripción
-- todavía no tiene asistencia registrada.
-- Ejemplo: SELECT fn_attendance_percentage('10011', 'MAT011') FROM dual;  -- 60
CREATE OR REPLACE FUNCTION fn_attendance_percentage (
    p_group_nrc     IN groups.nrc%TYPE,
    p_enrollment_id IN enrollments.enrollment_id%TYPE
) RETURN NUMBER
IS
    v_percentage NUMBER;
BEGIN
    -- NULLIF evita dividir entre cero: sin registros, la división da NULL
    SELECT ROUND(100 * SUM(CASE WHEN attended = 'S' THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2)
    INTO v_percentage
    FROM attendances
    WHERE enrollment_group_group_nrc = p_group_nrc
      AND enrollment_group_enrollment_enrollment_id = p_enrollment_id;

    RETURN v_percentage;
END fn_attendance_percentage;
/

-- TRIGGERS

-- Trigger: trg_validate_attendance_date (módulo Asistencia)
-- Funcionalidad: antes de registrar o cambiar la fecha de una asistencia (INSERT o UPDATE en attendances),
-- valida que la fecha de la clase esté dentro del periodo académico del grupo (entre su fecha de
-- inicio y su fecha de finalización). Las llaves foráneas no pueden garantizar esta regla.
-- Si la fecha está por fuera del periodo, cancela la operación con un mensaje de error.
-- Ejemplo: INSERT INTO attendances VALUES ('AT10001-MAT001-9', DATE '2026-08-03', 'S', '10001', 'MAT001');
--          falla porque el grupo 10001 es del periodo 2026-1 (26/01/2026 a 12/06/2026).
CREATE OR REPLACE TRIGGER trg_validate_attendance_date
BEFORE INSERT OR UPDATE OF attendance_date, enrollment_group_group_nrc ON attendances
FOR EACH ROW
DECLARE
    v_start_date academics_terms.start_date%TYPE;
    v_end_date   academics_terms.end_date%TYPE;
BEGIN
    -- Fechas del periodo académico del grupo
    SELECT t.start_date, t.end_date
    INTO v_start_date, v_end_date
    FROM groups g
    INNER JOIN academics_terms t ON t.academic_term_id = g.academic_term_academic_term_id
    WHERE g.nrc = :NEW.enrollment_group_group_nrc;

    IF :NEW.attendance_date < v_start_date OR :NEW.attendance_date > v_end_date THEN
        RAISE_APPLICATION_ERROR(-20033, 'La fecha ' || TO_CHAR(:NEW.attendance_date, 'DD/MM/YYYY') ||
            ' esta fuera del periodo academico del grupo ' || :NEW.enrollment_group_group_nrc);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20034, 'El grupo ' || :NEW.enrollment_group_group_nrc || ' no existe');
END;
/

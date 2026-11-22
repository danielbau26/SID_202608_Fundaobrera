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

-- MÓDULO ESTADO ACADÉMICO

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
    WHERE enrollment_id = p_enrollment_id;

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

-- Función: fn_count_students_by_status (módulo Estado académico)
-- Funcionalidad: cuenta cuántos estudiantes distintos tienen matrículas en un estado
-- (cursando, retirado o graduado), en toda la institución o solo en un programa.
-- Parámetros:
--   p_status     Estado a contar.
--   p_program_id Programa a filtrar (opcional; si se omite, cuenta en todos los programas).
-- Retorna: la cantidad de estudiantes (0 si no hay ninguno).
-- Ejemplos: SELECT fn_count_students_by_status('retirado') FROM dual;             -- 10
--           SELECT fn_count_students_by_status('retirado', 'PROG002') FROM dual;  -- 4
CREATE OR REPLACE FUNCTION fn_count_students_by_status (
    p_status     IN statuses.name%TYPE,
    p_program_id IN programs.program_id%TYPE DEFAULT NULL
) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT student_document_number)
    INTO v_count
    FROM enrollments
    WHERE status_name = LOWER(p_status)
      AND (p_program_id IS NULL OR program_program_id = p_program_id);

    RETURN v_count;
END fn_count_students_by_status;
/

-- TRIGGERS

-- Trigger: trg_graduate_enrollment (módulo Estado académico)
-- Funcionalidad: antes de registrar una graduación (INSERT en graduates), busca la matrícula
-- más reciente del estudiante en ese programa y la cambia automáticamente a 'graduado',
-- como pide la historia "Registrar graduación de un estudiante".
-- Si el estudiante no tiene matrículas en el programa, o su última matrícula está retirada,
-- cancela la graduación con un mensaje de error.
-- Ejemplo: INSERT INTO graduates VALUES (DATE '2026-12-10', 'ACTA-2026-001', 'actas/ACTA-2026-001.pdf', '900000001', 'PROG001');
--          deja la matrícula MAT001 en estado 'graduado'.
CREATE OR REPLACE TRIGGER trg_graduate_enrollment
BEFORE INSERT ON graduates
FOR EACH ROW
DECLARE
    v_enrollment_id enrollments.enrollment_id%TYPE;
    v_status        enrollments.status_name%TYPE;
BEGIN
    -- Matrícula más reciente del estudiante en el programa (según la fecha de inicio del periodo)
    SELECT e.enrollment_id, e.status_name
    INTO v_enrollment_id, v_status
    FROM enrollments e
    INNER JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
    WHERE e.student_document_number = :NEW.student_document_number
      AND e.program_program_id = :NEW.program_program_id
    ORDER BY t.start_date DESC
    FETCH FIRST 1 ROWS ONLY;

    IF v_status = 'retirado' THEN
        RAISE_APPLICATION_ERROR(-20023, 'El estudiante ' || :NEW.student_document_number ||
            ' esta retirado del programa ' || :NEW.program_program_id || ' y no puede graduarse');
    END IF;

    UPDATE enrollments
    SET status_name = 'graduado'
    WHERE enrollment_id = v_enrollment_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20024, 'El estudiante ' || :NEW.student_document_number ||
            ' no tiene matriculas en el programa ' || :NEW.program_program_id);
END;
/

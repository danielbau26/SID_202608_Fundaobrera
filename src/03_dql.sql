-- Reportes

-- Reporte 1. Lista los estudiantes matriculados en cada programa
-- Cada estudiante aparece una vez por programa, aunque tenga varias matrículas
SELECT DISTINCT p.program_id, p.name AS program_name, s.document_number, s.full_name AS student_name
FROM enrollments e
JOIN programs p ON p.program_id = e.program_program_id
JOIN students s ON s.document_number = e.student_document_number
ORDER BY p.name, p.program_id, s.full_name, s.document_number;

-- Reporte 2. Cuenta los estudiantes matriculados por programa y periodo académico
-- Si un programa no tiene matrículas, aparece con conteo cero y sin periodo.
SELECT p.program_id, p.name AS program_name, t.academic_term_id, COUNT(DISTINCT e.student_document_number) AS student_count
FROM programs p
LEFT JOIN enrollments e ON e.program_program_id = p.program_id
LEFT JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
GROUP BY p.program_id, p.name, t.academic_term_id, t.start_date
ORDER BY t.start_date, t.academic_term_id, p.name, p.program_id;

-- Reporte 3. Materias cursadas por cada estudiante.
-- Muestra el documento y nombre del estudiante, el periodo académico,
-- el programa, la materia, el NRC del grupo y el docente asignado.
-- Relaciona cada matrícula con sus grupos para identificar las materias.
-- Incluye únicamente las matrículas que tienen grupos asignados.
-- Ordena por nombre del estudiante, fecha de inicio del periodo y materia.
SELECT s.document_number, s.full_name AS student_name, t.academic_term_id, p.name AS program_name,
       sub.name AS subject_name, g.nrc, te.full_name AS teacher_name
FROM students s
JOIN enrollments e ON e.student_document_number = s.document_number
JOIN programs p ON p.program_id = e.program_program_id
JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
JOIN enrollments_groups eg ON eg.enrollment_enrollment_id = e.enrollment_id
JOIN groups g ON g.nrc = eg.group_nrc
JOIN subjects sub ON sub.subject_id = g.program_subject_subject_subject_id
JOIN teachers te ON te.document_number = g.teacher_document_number
ORDER BY s.full_name, t.start_date, sub.name;

-- MÓDULO CALIFICACIONES
-- La nota definitiva de cada materia se obtiene con la función fn_final_grade (04_plsql.sql),
-- que suma cada nota por el porcentaje de su actividad y divide entre 100.
-- Por eso los reportes 4 a 7 necesitan que 04_plsql.sql se haya ejecutado antes.
-- Una materia se aprueba con definitiva de 3.0 o más.

-- Reporte 4. Calificaciones obtenidas por cada estudiante.
-- Muestra, para cada estudiante, la nota definitiva de cada materia que cursó, con el periodo,
-- el programa y el NRC del grupo. Parte de las inscripciones (enrollments_groups) y las une con
-- la matrícula, el estudiante, el programa, el periodo, el grupo y la materia (INNER JOIN).
-- Ordena por estudiante, periodo y materia.
SELECT s.document_number, s.full_name AS student_name, t.academic_term_id, p.name AS program_name,
       sub.name AS subject_name, g.nrc,
       fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id) AS final_grade
FROM enrollments_groups eg
INNER JOIN enrollments e ON e.enrollment_id = eg.enrollment_enrollment_id
INNER JOIN students s ON s.document_number = e.student_document_number
INNER JOIN programs p ON p.program_id = e.program_program_id
INNER JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
INNER JOIN groups g ON g.nrc = eg.group_nrc
INNER JOIN subjects sub ON sub.subject_id = g.program_subject_subject_subject_id
ORDER BY s.full_name, t.start_date, sub.name;

-- Reporte 5. Promedio académico de cada estudiante por programa y periodo.
-- Promedia las notas definitivas de las materias de cada estudiante.
-- Si no tiene materias calificadas, su promedio aparece como NULL.
-- Ordena por periodo, programa y promedio de mayor a menor.
SELECT s.document_number,
       s.full_name AS student_name,
       p.program_id,
       p.name AS program_name,
       t.academic_term_id,
       COUNT(fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id)) AS graded_subjects,
       ROUND(AVG(fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id)), 2) AS average_grade
FROM enrollments e
JOIN students s ON s.document_number = e.student_document_number
JOIN programs p ON p.program_id = e.program_program_id
JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
LEFT JOIN enrollments_groups eg ON eg.enrollment_enrollment_id = e.enrollment_id
GROUP BY s.document_number, s.full_name, p.program_id, p.name,
         t.academic_term_id, t.start_date
ORDER BY t.start_date, t.academic_term_id, p.name, p.program_id,
         average_grade DESC NULLS LAST, s.full_name, s.document_number;

-- Reporte 6. Materias aprobadas y no aprobadas por estudiante.
-- Muestra el estudiante, el programa, el periodo, la materia y su nota definitiva.
-- Clasifica como aprobada una materia con nota de 3.0 o más y como no aprobada
-- una materia con nota inferior a 3.0.
-- Identifica las matrículas sin materias asignadas y las materias sin calificaciones.
-- Usa LEFT JOIN para conservar esas matrículas en el resultado y CASE para clasificarlas.
-- Obtiene la definitiva mediante fn_final_grade.
-- Ordena por estudiante, periodo, programa, materia y grupo.
SELECT document_number, student_name, program_name, academic_term_id, subject_name, nrc, final_grade,
       CASE
           WHEN nrc IS NULL THEN 'Sin materias asignadas'
           WHEN final_grade IS NULL THEN 'Sin calificaciones registradas'
           WHEN final_grade >= 3 THEN 'Aprobada'
           ELSE 'No aprobada'
       END AS result
FROM (
    SELECT s.document_number, s.full_name AS student_name, p.name AS program_name, t.academic_term_id, t.start_date, sub.name AS subject_name,
           g.nrc,
           fn_final_grade( eg.group_nrc, eg.enrollment_enrollment_id ) AS final_grade
    FROM enrollments e
    JOIN students s ON s.document_number = e.student_document_number
    JOIN programs p ON p.program_id = e.program_program_id
    JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
    LEFT JOIN enrollments_groups eg ON eg.enrollment_enrollment_id = e.enrollment_id
    LEFT JOIN groups g ON g.nrc = eg.group_nrc
    LEFT JOIN subjects sub ON sub.subject_id = g.program_subject_subject_subject_id
)
ORDER BY student_name, document_number, start_date, academic_term_id, program_name, subject_name, nrc;

-- Reporte 7 (TOP). Los 10 estudiantes con mejor promedio académico
-- Promedia las notas definitivas disponibles de todos los periodos académicos
-- Muestra la cantidad de materias cursadas, aprobadas y no aprobadas
-- Ordena de mayor a menor promedio y devuelve las primeras diez filas
SELECT document_number, student_name, program_name,
       COUNT(*) AS subjects_taken,
       SUM(CASE WHEN final_grade >= 3 THEN 1 ELSE 0 END) AS subjects_passed,
       SUM(CASE WHEN final_grade < 3 THEN 1 ELSE 0 END) AS subjects_failed,
       ROUND(AVG(final_grade), 2) AS average_grade
FROM (
    SELECT s.document_number, s.full_name AS student_name, p.name AS program_name,
           fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id) AS final_grade
    FROM enrollments_groups eg
    INNER JOIN enrollments e ON e.enrollment_id = eg.enrollment_enrollment_id
    INNER JOIN students s ON s.document_number = e.student_document_number
    INNER JOIN programs p ON p.program_id = e.program_program_id
)
GROUP BY document_number, student_name, program_name
ORDER BY average_grade DESC NULLS LAST, student_name
FETCH FIRST 10 ROWS ONLY;

-- MÓDULO ESTADO ACADÉMICO

-- Reporte 8. Estudiantes activos (cursando), retirados y graduados por programa.
-- Cuenta cuántos estudiantes hay en cada estado dentro de cada programa.
-- Combina todos los programas con todos los estados (CROSS JOIN) y usa LEFT JOIN hacia las
-- matrículas, así una combinación sin estudiantes aparece con conteo cero en lugar de desaparecer.
-- Agrupa por programa y estado, y ordena por nombre del programa y estado.
SELECT p.program_id, p.name AS program_name, st.name AS status_name,
       COUNT(DISTINCT e.student_document_number) AS student_count
FROM programs p
CROSS JOIN statuses st
LEFT JOIN enrollments e ON e.program_program_id = p.program_id
                       AND e.status_name = st.name
GROUP BY p.program_id, p.name, st.name
ORDER BY p.name, st.name;

-- Reporte 9. Estudiantes retirados y sus motivos.
-- Muestra cada matrícula en estado retirado con el estudiante, el programa, el periodo,
-- el semestre que cursaba, la fecha y el motivo del retiro (INNER JOIN con estudiantes y programas).
-- Ordena del retiro más reciente al más antiguo.
SELECT s.document_number, s.full_name AS student_name, p.name AS program_name,
       e.academic_term_academic_term_id AS academic_term_id, e.semester_number,
       e.withdrawal_date, e.withdrawal_reason
FROM enrollments e
INNER JOIN students s ON s.document_number = e.student_document_number
INNER JOIN programs p ON p.program_id = e.program_program_id
WHERE e.status_name = 'retirado'
ORDER BY e.withdrawal_date DESC, s.full_name;

-- Reporte 10. Estudiantes graduados y sus fechas de graduación.
-- Lista cada graduación con el estudiante, el programa del que se graduó, la fecha,
-- el número de acta y el documento del acta (INNER JOIN con estudiantes y programas).
-- Ordena por fecha de graduación, programa y nombre del estudiante.
SELECT s.document_number, s.full_name AS student_name, p.name AS program_name,
       gr.graduation_date, gr.certificate_number, gr.certificate_document
FROM graduates gr
INNER JOIN students s ON s.document_number = gr.student_document_number
INNER JOIN programs p ON p.program_id = gr.program_program_id
ORDER BY gr.graduation_date, p.name, s.full_name;

-- MÓDULO ASISTENCIA
-- Cada registro de attendances es una clase de una inscripción (matrícula en un grupo):
-- attended = 'S' si el estudiante asistió y 'N' si no asistió.
-- El porcentaje de asistencia es (clases asistidas / clases registradas) * 100.
-- Se toma 80 % como mínimo de asistencia; por debajo de ese valor el estudiante queda 'En riesgo'.
-- El reporte 12 usa la función fn_attendance_percentage (04_plsql.sql).
-- Los reportes salen del enunciado: "porcentaje de asistencia de los estudiantes" y
-- "consultar… las notas y asistencias de sus estudiantes".

-- Reporte 11. Porcentaje de asistencia de los estudiantes.
-- Muestra, para cada estudiante, el porcentaje de asistencia en cada materia que cursa, con el periodo,
-- el NRC del grupo y el docente. Parte de las inscripciones (enrollments_groups) y las une con
-- la matrícula, el estudiante, el periodo, el grupo, la materia y el docente (INNER JOIN).
-- Si la inscripción todavía no tiene asistencia registrada, la función devuelve NULL y el estado es 'Sin registros'.
-- Ordena por estudiante, periodo y materia.
SELECT document_number, student_name, academic_term_id, subject_name, nrc, teacher_name, attendance_percentage,
       CASE
           WHEN attendance_percentage IS NULL THEN 'Sin registros'
           WHEN attendance_percentage >= 80 THEN 'Cumple'
           ELSE 'En riesgo'
       END AS attendance_status
FROM (
    SELECT s.document_number, s.full_name AS student_name, t.academic_term_id, t.start_date,
           sub.name AS subject_name, g.nrc, te.full_name AS teacher_name,
           fn_attendance_percentage(eg.group_nrc, eg.enrollment_enrollment_id) AS attendance_percentage
    FROM enrollments_groups eg
    INNER JOIN enrollments e ON e.enrollment_id = eg.enrollment_enrollment_id
    INNER JOIN students s ON s.document_number = e.student_document_number
    INNER JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
    INNER JOIN groups g ON g.nrc = eg.group_nrc
    INNER JOIN subjects sub ON sub.subject_id = g.program_subject_subject_subject_id
    INNER JOIN teachers te ON te.document_number = g.teacher_document_number
)
ORDER BY student_name, start_date, subject_name;
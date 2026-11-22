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
-- Muestra, para cada estudiante, las materias que cursa o cursó en cada una de sus matrículas,
-- con el periodo académico, el programa, el NRC del grupo y el docente que dicta la materia.
-- Se ordena por nombre del estudiante, periodo y nombre de la materia.
--flujo : student tiene el nombre del estudiante, pero no sabe que materias ve. 
-- enrollments no da la matricula de ese estudiante, enrollments group dice a que grupos esta inscrito esa matricula
-- groups dice que materia es cada grupo especifico y pues subject ya tiene el nombre de la materia..
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

-- Reporte 5. Promedio académico de los estudiantes por programa y periodo académico.
-- Por cada programa y periodo cuenta los estudiantes con notas y promedia sus definitivas,
-- mostrando también la nota más baja y la más alta.
-- Parte de la combinación de todos los programas con todos los periodos (CROSS JOIN) y usa
-- LEFT JOIN hacia las matrículas e inscripciones, así un programa sin notas en un periodo
-- aparece con promedio vacío (NULL) en lugar de desaparecer.
-- Agrupa por programa y periodo, y ordena por periodo y por promedio de mayor a menor.
SELECT p.program_id, p.name AS program_name, t.academic_term_id,
       COUNT(DISTINCT e.student_document_number) AS enrolled_students,
       ROUND(AVG(fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id)), 2) AS average_grade,
       MIN(fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id)) AS lowest_grade,
       MAX(fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id)) AS highest_grade
FROM programs p
CROSS JOIN academics_terms t
LEFT JOIN enrollments e ON e.program_program_id = p.program_id
                       AND e.academic_term_academic_term_id = t.academic_term_id
LEFT JOIN enrollments_groups eg ON eg.enrollment_enrollment_id = e.enrollment_id
GROUP BY p.program_id, p.name, t.academic_term_id, t.start_date
ORDER BY t.start_date, average_grade DESC NULLS LAST, p.name;

-- Reporte 6. Materias aprobadas y no aprobadas.
-- Lista cada materia que cursó cada estudiante con su definitiva y su resultado:
-- 'Aprobada' si la definitiva es 3.0 o más, 'No aprobada' si es menor y 'Sin calificar'
-- si todavía no tiene notas (la función devuelve NULL).
-- La subconsulta calcula la definitiva una sola vez por inscripción.
-- Ordena primero las no aprobadas, luego las aprobadas y al final las sin calificar.
SELECT document_number, student_name, academic_term_id, subject_name, nrc, final_grade,
       CASE
           WHEN final_grade IS NULL THEN 'Sin calificar'
           WHEN final_grade >= 3 THEN 'Aprobada'
           ELSE 'No aprobada'
       END AS result
FROM (
    SELECT s.document_number, s.full_name AS student_name, t.academic_term_id, t.start_date,
           sub.name AS subject_name, g.nrc,
           fn_final_grade(eg.group_nrc, eg.enrollment_enrollment_id) AS final_grade
    FROM enrollments_groups eg
    INNER JOIN enrollments e ON e.enrollment_id = eg.enrollment_enrollment_id
    INNER JOIN students s ON s.document_number = e.student_document_number
    INNER JOIN academics_terms t ON t.academic_term_id = e.academic_term_academic_term_id
    INNER JOIN groups g ON g.nrc = eg.group_nrc
    INNER JOIN subjects sub ON sub.subject_id = g.program_subject_subject_subject_id
)
ORDER BY CASE
             WHEN final_grade IS NULL THEN 3
             WHEN final_grade >= 3 THEN 2
             ELSE 1
         END,
         student_name, start_date, subject_name;

-- Reporte 7 (TOP). Los 10 estudiantes con mejor promedio académico.
-- Promedia las definitivas de las materias de cada estudiante en su programa, cuenta cuántas
-- aprobó y cuántas no, y devuelve solo los 10 mejores promedios
-- (FETCH FIRST 10 ROWS ONLY es el TOP de Oracle).
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

-- Reporte 11 (TOP). Los 3 programas con más estudiantes retirados.
-- Cuenta las matrículas retiradas de cada programa, las ordena de mayor a menor
-- y devuelve solo las 3 primeras (FETCH FIRST 3 ROWS ONLY es el TOP de Oracle).
-- Sirve para identificar en qué programas hay más deserción.
SELECT p.program_id, p.name AS program_name, COUNT(*) AS withdrawn_count
FROM enrollments e
INNER JOIN programs p ON p.program_id = e.program_program_id
WHERE e.status_name = 'retirado'
GROUP BY p.program_id, p.name
ORDER BY withdrawn_count DESC, p.name
FETCH FIRST 3 ROWS ONLY;

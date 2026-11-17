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
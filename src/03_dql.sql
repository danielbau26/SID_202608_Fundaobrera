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

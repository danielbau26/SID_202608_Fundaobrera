--Datos ficticios

-- Programas de prueba (Duracion en semestres)
INSERT INTO programs (program_id, name, duration) VALUES ('PROG001', 'Auxiliar administrativo', 3);
INSERT INTO programs (program_id, name, duration) VALUES ('PROG002', 'Auxiliar contable', 3);
INSERT INTO programs (program_id, name, duration) VALUES ('PROG003', 'Auxiliar de sistemas', 3);
INSERT INTO programs (program_id, name, duration) VALUES ('PROG004', 'Auxiliar de mercadeo', 3);
INSERT INTO programs (program_id, name, duration) VALUES ('PROG005', 'Auxiliar de talento humano', 3);

-- Periodos disponibles para las matrículas de prueba.
INSERT INTO academics_terms (academic_term_id, year, start_date, end_date)
VALUES ('2026-1', 2026, DATE '2026-01-26', DATE '2026-06-12');
INSERT INTO academics_terms (academic_term_id, year, start_date, end_date)
VALUES ('2026-2', 2026, DATE '2026-07-27', DATE '2026-12-04');

-- Estado de las matrículas de prueba según las dependencias funcionales.
INSERT INTO statuses (name) VALUES ('cursando');

-- Estudiantes de prueba
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000001', 'Ana Torres', 'CC', DATE '2000-05-10', '3000000001', 'Dirección de prueba 1', 'estudiante1@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000002', 'Mateo Rojas', 'CC', DATE '2001-05-11', '3000000002', 'Dirección de prueba 2', 'estudiante2@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000003', 'Laura Gómez', 'CC', DATE '2002-05-12', '3000000003', 'Dirección de prueba 3', 'estudiante3@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000004', 'David Ruiz', 'CC', DATE '2003-05-13', '3000000004', 'Dirección de prueba 4', 'estudiante4@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000005', 'Camila Díaz', 'CC', DATE '2004-05-14', '3000000005', 'Dirección de prueba 5', 'estudiante5@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000006', 'Lucas Pérez', 'CC', DATE '2000-05-15', '3000000006', 'Dirección de prueba 6', 'estudiante6@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000007', 'Sara León', 'CC', DATE '2001-05-16', '3000000007', 'Dirección de prueba 7', 'estudiante7@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000008', 'Felipe Mora', 'CC', DATE '2002-05-17', '3000000008', 'Dirección de prueba 8', 'estudiante8@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000009', 'Valeria Cruz', 'CC', DATE '2003-05-18', '3000000009', 'Dirección de prueba 9', 'estudiante9@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000010', 'Diego Soto', 'CC', DATE '2004-05-19', '3000000010', 'Dirección de prueba 10', 'estudiante10@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000011', 'Elena Vega', 'CC', DATE '2000-05-20', '3000000011', 'Dirección de prueba 11', 'estudiante11@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000012', 'Nicolás Lara', 'CC', DATE '2001-05-21', '3000000012', 'Dirección de prueba 12', 'estudiante12@example.com', 3);

-- Doce matrículas en diez combinaciones de programa y periodo.
-- Dos combinaciones tienen dos estudiantes para probar el conteo agrupado.
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT001', 1, 'cursando', '900000001', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT002', 1, 'cursando', '900000002', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT003', 1, 'cursando', '900000003', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT004', 1, 'cursando', '900000004', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT005', 1, 'cursando', '900000005', 'PROG005');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT006', 1, 'cursando', '900000006', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT007', 1, 'cursando', '900000007', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT008', 1, 'cursando', '900000008', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT009', 1, 'cursando', '900000009', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT010', 1, 'cursando', '900000010', 'PROG005');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT011', 1, 'cursando', '900000011', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2026-2', 'MAT012', 1, 'cursando', '900000012', 'PROG002');

-- MATERIAS Y GRUPOS

-- Materias. SUB002 (Ofimática básica) se comparte entre dos programas para probar la relación muchos a muchos.
INSERT INTO subjects (subject_id, name) VALUES ('SUB001', 'Fundamentos de administración');
INSERT INTO subjects (subject_id, name) VALUES ('SUB002', 'Ofimática básica');
INSERT INTO subjects (subject_id, name) VALUES ('SUB003', 'Contabilidad básica');
INSERT INTO subjects (subject_id, name) VALUES ('SUB004', 'Introducción a la programación');
INSERT INTO subjects (subject_id, name) VALUES ('SUB005', 'Mantenimiento de computadores');
INSERT INTO subjects (subject_id, name) VALUES ('SUB006', 'Fundamentos de mercadeo');
INSERT INTO subjects (subject_id, name) VALUES ('SUB007', 'Servicio al cliente');
INSERT INTO subjects (subject_id, name) VALUES ('SUB008', 'Fundamentos de talento humano');
INSERT INTO subjects (subject_id, name) VALUES ('SUB009', 'Legislación laboral');
INSERT INTO subjects (subject_id, name) VALUES ('SUB010', 'Comunicación oral y escrita');


-- Materias de cada programa. Todas las matrículas de prueba son de semestre 1,
-- por eso cada programa tiene dos materias de semestre 1. SUB010 queda en semestre 2.
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG001', 'SUB001', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG001', 'SUB002', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG002', 'SUB003', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG002', 'SUB002', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG003', 'SUB004', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG003', 'SUB005', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG004', 'SUB006', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG004', 'SUB007', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG005', 'SUB008', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG005', 'SUB009', 1);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG001', 'SUB010', 2);
INSERT INTO programs_subjects (program_program_id, subject_subject_id, semester) VALUES ('PROG004', 'SUB010', 2);

-- Docentes de prueba
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000001', 'Carlos Méndez', 'CC', 'Dirección docente 1', 'docente1@example.com', '3100000001');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000002', 'Patricia Ramírez', 'CC', 'Dirección docente 2', 'docente2@example.com', '3100000002');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000003', 'Jorge Castillo', 'CC', 'Dirección docente 3', 'docente3@example.com', '3100000003');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000004', 'Marcela Ospina', 'CC', 'Dirección docente 4', 'docente4@example.com', '3100000004');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000005', 'Andrés Salazar', 'CE', 'Dirección docente 5', 'docente5@example.com', '3100000005');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000006', 'Lina Quintero', 'CC', 'Dirección docente 6', 'docente6@example.com', '3100000006');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000007', 'Ricardo Valencia', 'CC', 'Dirección docente 7', 'docente7@example.com', '3100000007');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000008', 'Sofía Herrera', 'PA', 'Dirección docente 8', 'docente8@example.com', '3100000008');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000009', 'Hernán Muñoz', 'CC', 'Dirección docente 9', 'docente9@example.com', '3100000009');
INSERT INTO teachers (document_number, full_name, document_type, address, email, phone) VALUES ('800000010', 'Diana Cardona', 'CC', 'Dirección docente 10', 'docente10@example.com', '3100000010');

-- Grupos del periodo 2026-1 (NRC 1xxxx). El grupo 10011 es un segundo grupo de SUB001
-- en PROG001, para probar que una materia puede tener varios grupos en el mismo periodo.
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000001', 'PROG001', 'SUB001', '10001');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000002', 'PROG001', 'SUB002', '10002');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000003', 'PROG002', 'SUB003', '10003');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000004', 'PROG002', 'SUB002', '10004');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000005', 'PROG003', 'SUB004', '10005');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000006', 'PROG003', 'SUB005', '10006');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000007', 'PROG004', 'SUB006', '10007');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000008', 'PROG004', 'SUB007', '10008');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000009', 'PROG005', 'SUB008', '10009');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000010', 'PROG005', 'SUB009', '10010');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-1', '800000002', 'PROG001', 'SUB001', '10011');

-- Grupos del periodo 2026-2 (NRC 2xxxx)
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000001', 'PROG001', 'SUB001', '20001');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000002', 'PROG001', 'SUB002', '20002');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000003', 'PROG002', 'SUB003', '20003');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000004', 'PROG002', 'SUB002', '20004');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000005', 'PROG003', 'SUB004', '20005');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000006', 'PROG003', 'SUB005', '20006');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000007', 'PROG004', 'SUB006', '20007');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000008', 'PROG004', 'SUB007', '20008');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000009', 'PROG005', 'SUB008', '20009');
INSERT INTO groups (academic_term_academic_term_id, teacher_document_number, program_subject_program_program_id, program_subject_subject_subject_id, nrc) VALUES ('2026-2', '800000010', 'PROG005', 'SUB009', '20010');

-- Inscripción de cada matrícula a un grupo por cada materia de su semestre.
-- Cada grupo pertenece al mismo programa y periodo de la matrícula.
-- 2026-1
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10001', 'MAT001');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10002', 'MAT001');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10011', 'MAT011');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10002', 'MAT011');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10003', 'MAT002');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10004', 'MAT002');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10005', 'MAT003');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10006', 'MAT003');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10007', 'MAT004');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10008', 'MAT004');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10009', 'MAT005');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('10010', 'MAT005');
-- 2026-2
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20001', 'MAT006');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20002', 'MAT006');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20003', 'MAT007');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20004', 'MAT007');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20003', 'MAT012');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20004', 'MAT012');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20005', 'MAT008');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20006', 'MAT008');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20007', 'MAT009');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20008', 'MAT009');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20009', 'MAT010');
INSERT INTO enrollments_groups (group_nrc, enrollment_enrollment_id) VALUES ('20010', 'MAT010');

--Guardar los cambios
COMMIT;
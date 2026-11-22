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


-- CALIFICACIONES

-- Actividades evaluativas. Cada grupo tiene tres actividades: Parcial 1 (30 %), Parcial 2 (30 %)
-- y Examen final (40 %), que suman 100 %. Las fechas caen dentro del periodo del grupo.
-- El id de la actividad es ACT + NRC + número de la actividad.
-- Grupo 10001
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10001-1', 'Parcial 1', 30, '10001', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10001-2', 'Parcial 2', 30, '10001', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10001-3', 'Examen final', 40, '10001', DATE '2026-06-05');
-- Grupo 10002
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10002-1', 'Parcial 1', 30, '10002', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10002-2', 'Parcial 2', 30, '10002', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10002-3', 'Examen final', 40, '10002', DATE '2026-06-05');
-- Grupo 10003
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10003-1', 'Parcial 1', 30, '10003', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10003-2', 'Parcial 2', 30, '10003', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10003-3', 'Examen final', 40, '10003', DATE '2026-06-05');
-- Grupo 10004
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10004-1', 'Parcial 1', 30, '10004', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10004-2', 'Parcial 2', 30, '10004', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10004-3', 'Examen final', 40, '10004', DATE '2026-06-05');
-- Grupo 10005
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10005-1', 'Parcial 1', 30, '10005', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10005-2', 'Parcial 2', 30, '10005', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10005-3', 'Examen final', 40, '10005', DATE '2026-06-05');
-- Grupo 10006
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10006-1', 'Parcial 1', 30, '10006', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10006-2', 'Parcial 2', 30, '10006', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10006-3', 'Examen final', 40, '10006', DATE '2026-06-05');
-- Grupo 10007
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10007-1', 'Parcial 1', 30, '10007', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10007-2', 'Parcial 2', 30, '10007', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10007-3', 'Examen final', 40, '10007', DATE '2026-06-05');
-- Grupo 10008
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10008-1', 'Parcial 1', 30, '10008', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10008-2', 'Parcial 2', 30, '10008', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10008-3', 'Examen final', 40, '10008', DATE '2026-06-05');
-- Grupo 10009
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10009-1', 'Parcial 1', 30, '10009', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10009-2', 'Parcial 2', 30, '10009', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10009-3', 'Examen final', 40, '10009', DATE '2026-06-05');
-- Grupo 10010
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10010-1', 'Parcial 1', 30, '10010', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10010-2', 'Parcial 2', 30, '10010', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10010-3', 'Examen final', 40, '10010', DATE '2026-06-05');
-- Grupo 10011
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10011-1', 'Parcial 1', 30, '10011', DATE '2026-03-13');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10011-2', 'Parcial 2', 30, '10011', DATE '2026-04-24');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT10011-3', 'Examen final', 40, '10011', DATE '2026-06-05');
-- Grupo 20001
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20001-1', 'Parcial 1', 30, '20001', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20001-2', 'Parcial 2', 30, '20001', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20001-3', 'Examen final', 40, '20001', DATE '2026-11-27');
-- Grupo 20002
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20002-1', 'Parcial 1', 30, '20002', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20002-2', 'Parcial 2', 30, '20002', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20002-3', 'Examen final', 40, '20002', DATE '2026-11-27');
-- Grupo 20003
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20003-1', 'Parcial 1', 30, '20003', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20003-2', 'Parcial 2', 30, '20003', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20003-3', 'Examen final', 40, '20003', DATE '2026-11-27');
-- Grupo 20004
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20004-1', 'Parcial 1', 30, '20004', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20004-2', 'Parcial 2', 30, '20004', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20004-3', 'Examen final', 40, '20004', DATE '2026-11-27');
-- Grupo 20005
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20005-1', 'Parcial 1', 30, '20005', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20005-2', 'Parcial 2', 30, '20005', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20005-3', 'Examen final', 40, '20005', DATE '2026-11-27');
-- Grupo 20006
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20006-1', 'Parcial 1', 30, '20006', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20006-2', 'Parcial 2', 30, '20006', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20006-3', 'Examen final', 40, '20006', DATE '2026-11-27');
-- Grupo 20007
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20007-1', 'Parcial 1', 30, '20007', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20007-2', 'Parcial 2', 30, '20007', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20007-3', 'Examen final', 40, '20007', DATE '2026-11-27');
-- Grupo 20008
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20008-1', 'Parcial 1', 30, '20008', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20008-2', 'Parcial 2', 30, '20008', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20008-3', 'Examen final', 40, '20008', DATE '2026-11-27');
-- Grupo 20009
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20009-1', 'Parcial 1', 30, '20009', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20009-2', 'Parcial 2', 30, '20009', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20009-3', 'Examen final', 40, '20009', DATE '2026-11-27');
-- Grupo 20010
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20010-1', 'Parcial 1', 30, '20010', DATE '2026-09-11');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20010-2', 'Parcial 2', 30, '20010', DATE '2026-10-23');
INSERT INTO activities (activity_id, name, percentage, group_nrc, activity_date) VALUES ('ACT20010-3', 'Examen final', 40, '20010', DATE '2026-11-27');

-- Notas de cada estudiante en cada actividad de su grupo (entre 0.0 y 5.0).
-- enrollment_group_id_enrollment_group es la columna que el MR agrega a la llave primaria;
-- se usa un id por inscripción (EG001 a EG024), igual en las tres notas de esa inscripción.
-- Varias inscripciones quedan con definitiva menor a 3.0 para probar el reporte de materias no aprobadas.
-- EG001: matrícula MAT001 en el grupo 10001
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10001-1', 4.5, 'EG001', '10001', 'MAT001');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10001-2', 4.0, 'EG001', '10001', 'MAT001');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10001-3', 4.2, 'EG001', '10001', 'MAT001');
-- EG002: matrícula MAT001 en el grupo 10002
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-1', 3.8, 'EG002', '10002', 'MAT001');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-2', 4.1, 'EG002', '10002', 'MAT001');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-3', 3.5, 'EG002', '10002', 'MAT001');
-- EG003: matrícula MAT011 en el grupo 10011
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10011-1', 2.5, 'EG003', '10011', 'MAT011');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10011-2', 2.0, 'EG003', '10011', 'MAT011');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10011-3', 2.8, 'EG003', '10011', 'MAT011');
-- EG004: matrícula MAT011 en el grupo 10002
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-1', 3.0, 'EG004', '10002', 'MAT011');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-2', 3.5, 'EG004', '10002', 'MAT011');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10002-3', 3.2, 'EG004', '10002', 'MAT011');
-- EG005: matrícula MAT002 en el grupo 10003 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10003-1', 4.8, 'EG005', '10003', 'MAT002');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10003-2', 4.6, 'EG005', '10003', 'MAT002');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10003-3', 5.0, 'EG005', '10003', 'MAT002');
-- EG006: matrícula MAT002 en el grupo 10004
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10004-1', 4.0, 'EG006', '10004', 'MAT002');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10004-2', 3.9, 'EG006', '10004', 'MAT002');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10004-3', 4.4, 'EG006', '10004', 'MAT002');
-- EG007: matrícula MAT003 en el grupo 10005 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10005-1', 2.0, 'EG007', '10005', 'MAT003');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10005-2', 3.1, 'EG007', '10005', 'MAT003');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10005-3', 2.4, 'EG007', '10005', 'MAT003');
-- EG008: matrícula MAT003 en el grupo 10006 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10006-1', 3.6, 'EG008', '10006', 'MAT003');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10006-2', 3.0, 'EG008', '10006', 'MAT003');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10006-3', 3.3, 'EG008', '10006', 'MAT003');
-- EG009: matrícula MAT004 en el grupo 10007
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10007-1', 4.2, 'EG009', '10007', 'MAT004');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10007-2', 4.5, 'EG009', '10007', 'MAT004');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10007-3', 4.0, 'EG009', '10007', 'MAT004');
-- EG010: matrícula MAT004 en el grupo 10008
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10008-1', 3.9, 'EG010', '10008', 'MAT004');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10008-2', 4.3, 'EG010', '10008', 'MAT004');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10008-3', 4.7, 'EG010', '10008', 'MAT004');
-- EG011: matrícula MAT005 en el grupo 10009
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10009-1', 1.8, 'EG011', '10009', 'MAT005');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10009-2', 2.5, 'EG011', '10009', 'MAT005');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10009-3', 3.0, 'EG011', '10009', 'MAT005');
-- EG012: matrícula MAT005 en el grupo 10010 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10010-1', 3.2, 'EG012', '10010', 'MAT005');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10010-2', 2.8, 'EG012', '10010', 'MAT005');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT10010-3', 3.1, 'EG012', '10010', 'MAT005');
-- EG013: matrícula MAT006 en el grupo 20001 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20001-1', 4.1, 'EG013', '20001', 'MAT006');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20001-2', 3.7, 'EG013', '20001', 'MAT006');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20001-3', 3.9, 'EG013', '20001', 'MAT006');
-- EG014: matrícula MAT006 en el grupo 20002 
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20002-1', 2.9, 'EG014', '20002', 'MAT006');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20002-2', 3.4, 'EG014', '20002', 'MAT006');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20002-3', 3.0, 'EG014', '20002', 'MAT006');
-- EG015: matrícula MAT007 en el grupo 20003
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-1', 3.5, 'EG015', '20003', 'MAT007');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-2', 4.0, 'EG015', '20003', 'MAT007');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-3', 3.8, 'EG015', '20003', 'MAT007');
-- EG016: matrícula MAT007 en el grupo 20004
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-1', 4.6, 'EG016', '20004', 'MAT007');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-2', 4.2, 'EG016', '20004', 'MAT007');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-3', 4.9, 'EG016', '20004', 'MAT007');
-- EG017: matrícula MAT012 en el grupo 20003
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-1', 2.2, 'EG017', '20003', 'MAT012');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-2', 2.6, 'EG017', '20003', 'MAT012');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20003-3', 1.9, 'EG017', '20003', 'MAT012');
-- EG018: matrícula MAT012 en el grupo 20004
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-1', 3.0, 'EG018', '20004', 'MAT012');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-2', 2.7, 'EG018', '20004', 'MAT012');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20004-3', 2.5, 'EG018', '20004', 'MAT012');
-- EG019: matrícula MAT008 en el grupo 20005
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20005-1', 5.0, 'EG019', '20005', 'MAT008');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20005-2', 4.8, 'EG019', '20005', 'MAT008');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20005-3', 4.7, 'EG019', '20005', 'MAT008');
-- EG020: matrícula MAT008 en el grupo 20006
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20006-1', 4.4, 'EG020', '20006', 'MAT008');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20006-2', 4.1, 'EG020', '20006', 'MAT008');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20006-3', 4.3, 'EG020', '20006', 'MAT008');
-- EG021: matrícula MAT009 en el grupo 20007
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20007-1', 3.3, 'EG021', '20007', 'MAT009');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20007-2', 3.6, 'EG021', '20007', 'MAT009');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20007-3', 2.9, 'EG021', '20007', 'MAT009');
-- EG022: matrícula MAT009 en el grupo 20008
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20008-1', 2.7, 'EG022', '20008', 'MAT009');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20008-2', 3.0, 'EG022', '20008', 'MAT009');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20008-3', 3.2, 'EG022', '20008', 'MAT009');
-- EG023: matrícula MAT010 en el grupo 20009
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20009-1', 3.8, 'EG023', '20009', 'MAT010');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20009-2', 3.5, 'EG023', '20009', 'MAT010');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20009-3', 4.1, 'EG023', '20009', 'MAT010');
-- EG024: matrícula MAT010 en el grupo 20010
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20010-1', 4.0, 'EG024', '20010', 'MAT010');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20010-2', 4.4, 'EG024', '20010', 'MAT010');
INSERT INTO activities_grades (activities_activity_id, grade, enrollment_group_id_enrollment_group, enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) VALUES ('ACT20010-3', 3.6, 'EG024', '20010', 'MAT010');

-- MÓDULO ESTADO ACADÉMICO

-- Estados que faltaban en el catálogo. 'cursando' ya fue insertado arriba.
INSERT INTO statuses (name) VALUES ('retirado');
INSERT INTO statuses (name) VALUES ('graduado');

-- Periodos de 2025, necesarios para tener estudiantes que ya se retiraron o se graduaron.
INSERT INTO academics_terms (academic_term_id, year, start_date, end_date)
VALUES ('2025-1', 2025, DATE '2025-01-27', DATE '2025-06-13');
INSERT INTO academics_terms (academic_term_id, year, start_date, end_date)
VALUES ('2025-2', 2025, DATE '2025-07-28', DATE '2025-12-05');

-- Estudiantes 13 a 22: se retiraron. Estudiantes 23 a 32: se graduaron.
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000013', 'Andrés Molina', 'CC', DATE '1999-02-03', '3000000013', 'Dirección de prueba 13', 'estudiante13@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000014', 'Paula Ríos', 'CC', DATE '2000-03-04', '3000000014', 'Dirección de prueba 14', 'estudiante14@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000015', 'Julián Castro', 'CC', DATE '2001-04-05', '3000000015', 'Dirección de prueba 15', 'estudiante15@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000016', 'Mariana Ortiz', 'CC', DATE '2002-05-06', '3000000016', 'Dirección de prueba 16', 'estudiante16@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000017', 'Sebastián Muñoz', 'CC', DATE '2003-06-07', '3000000017', 'Dirección de prueba 17', 'estudiante17@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000018', 'Isabela Vargas', 'CC', DATE '1998-07-08', '3000000018', 'Dirección de prueba 18', 'estudiante18@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000019', 'Tomás Herrera', 'CC', DATE '2000-08-09', '3000000019', 'Dirección de prueba 19', 'estudiante19@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000020', 'Gabriela Silva', 'CC', DATE '2001-09-10', '3000000020', 'Dirección de prueba 20', 'estudiante20@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000021', 'Samuel Ramírez', 'CC', DATE '2002-10-11', '3000000021', 'Dirección de prueba 21', 'estudiante21@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000022', 'Antonia Navarro', 'CC', DATE '2003-11-12', '3000000022', 'Dirección de prueba 22', 'estudiante22@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000023', 'Juliana Mejía', 'CC', DATE '1997-01-13', '3000000023', 'Dirección de prueba 23', 'estudiante23@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000024', 'Alejandro Pardo', 'CC', DATE '1998-02-14', '3000000024', 'Dirección de prueba 24', 'estudiante24@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000025', 'Daniela Quintero', 'CC', DATE '1999-03-15', '3000000025', 'Dirección de prueba 25', 'estudiante25@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000026', 'Santiago Cárdenas', 'CC', DATE '2000-04-16', '3000000026', 'Dirección de prueba 26', 'estudiante26@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000027', 'Natalia Osorio', 'CC', DATE '2001-05-17', '3000000027', 'Dirección de prueba 27', 'estudiante27@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000028', 'Martín Salazar', 'CC', DATE '1999-06-18', '3000000028', 'Dirección de prueba 28', 'estudiante28@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000029', 'Carolina Bernal', 'CC', DATE '2000-07-19', '3000000029', 'Dirección de prueba 29', 'estudiante29@example.com', 1);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000030', 'Emilio Franco', 'CC', DATE '2001-08-20', '3000000030', 'Dirección de prueba 30', 'estudiante30@example.com', 2);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000031', 'Victoria Peña', 'CC', DATE '1998-09-21', '3000000031', 'Dirección de prueba 31', 'estudiante31@example.com', 3);
INSERT INTO students (document_number, full_name, document_type, birth_date, phone, address, email, stratum)
VALUES ('900000032', 'Joaquín Restrepo', 'CC', DATE '1999-10-22', '3000000032', 'Dirección de prueba 32', 'estudiante32@example.com', 1);

-- Diez matrículas retiradas, cada una con fecha (dentro del periodo) y motivo, como exige enrollment_withdrawal_ck.
-- PROG002 tiene más retiros que los demás programas para que el reporte TOP muestre diferencias.
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-1', 'MAT013', 1, 'retirado', DATE '2025-03-14', 'Consiguió empleo de tiempo completo', '900000013', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-1', 'MAT014', 1, 'retirado', DATE '2025-04-02', 'Dificultades económicas', '900000014', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-1', 'MAT015', 1, 'retirado', DATE '2025-05-08', 'Cambio de ciudad', '900000015', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT016', 2, 'retirado', DATE '2025-08-29', 'Problemas de salud', '900000016', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT017', 1, 'retirado', DATE '2025-09-15', 'Cruce de horario con el trabajo', '900000017', 'PROG005');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT018', 2, 'retirado', DATE '2025-10-03', 'Dificultades económicas', '900000018', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT019', 1, 'retirado', DATE '2025-10-21', 'Cambio de institución', '900000019', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT020', 1, 'retirado', DATE '2026-02-20', 'Calamidad familiar', '900000020', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT021', 1, 'retirado', DATE '2026-03-18', 'Consiguió empleo de tiempo completo', '900000021', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, withdrawal_date, withdrawal_reason, student_document_number, program_program_id)
VALUES ('2026-1', 'MAT022', 2, 'retirado', DATE '2026-04-24', 'Cambio de ciudad', '900000022', 'PROG002');

-- Diez matrículas de último semestre (3) en 2025-2 que terminaron en graduación.
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT023', 3, 'graduado', '900000023', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT024', 3, 'graduado', '900000024', 'PROG001');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT025', 3, 'graduado', '900000025', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT026', 3, 'graduado', '900000026', 'PROG002');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT027', 3, 'graduado', '900000027', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT028', 3, 'graduado', '900000028', 'PROG003');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT029', 3, 'graduado', '900000029', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT030', 3, 'graduado', '900000030', 'PROG004');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT031', 3, 'graduado', '900000031', 'PROG005');
INSERT INTO enrollments (academic_term_academic_term_id, enrollment_id, semester_number, status_name, student_document_number, program_program_id)
VALUES ('2025-2', 'MAT032', 3, 'graduado', '900000032', 'PROG005');

-- Graduaciones: fecha, número de acta (único) y documento del acta en PDF.
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-12', 'ACTA-2025-001', 'actas/ACTA-2025-001.pdf', '900000023', 'PROG001');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-12', 'ACTA-2025-002', 'actas/ACTA-2025-002.pdf', '900000024', 'PROG001');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-12', 'ACTA-2025-003', 'actas/ACTA-2025-003.pdf', '900000025', 'PROG002');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-12', 'ACTA-2025-004', 'actas/ACTA-2025-004.pdf', '900000026', 'PROG002');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-15', 'ACTA-2025-005', 'actas/ACTA-2025-005.pdf', '900000027', 'PROG003');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-15', 'ACTA-2025-006', 'actas/ACTA-2025-006.pdf', '900000028', 'PROG003');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-15', 'ACTA-2025-007', 'actas/ACTA-2025-007.pdf', '900000029', 'PROG004');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-17', 'ACTA-2025-008', 'actas/ACTA-2025-008.pdf', '900000030', 'PROG004');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-17', 'ACTA-2025-009', 'actas/ACTA-2025-009.pdf', '900000031', 'PROG005');
INSERT INTO graduates (graduation_date, certificate_number, certificate_document, student_document_number, program_program_id)
VALUES (DATE '2025-12-17', 'ACTA-2025-010', 'actas/ACTA-2025-010.pdf', '900000032', 'PROG005');
--Guardar los cambios
COMMIT;
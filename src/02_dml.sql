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

--Guardar los cambios
COMMIT;
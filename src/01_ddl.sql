-- El bloque inicial elimina las tablas existentes antes de recrearlas
DROP TABLE works_experiences;
DROP TABLE graduates;
DROP TABLE attendances;
DROP TABLE activities_grades;
DROP TABLE activities;
DROP TABLE enrollments_groups;
DROP TABLE groups;
DROP TABLE programs_subjects;
DROP TABLE enrollments;
DROP TABLE teachers;
DROP TABLE subjects;
DROP TABLE statuses;
DROP TABLE academics_terms;
DROP TABLE programs;
DROP TABLE students;

-- TABLAS

-- Estudiantes
CREATE TABLE students (
    document_number VARCHAR2(20),
    full_name       VARCHAR2(100) NOT NULL,
    document_type   VARCHAR2(5) NOT NULL,
    birth_date      DATE NOT NULL,
    phone           VARCHAR2(15) NOT NULL,
    address         VARCHAR2(150) NOT NULL,
    email           VARCHAR2(120) NOT NULL,
    stratum         NUMBER(1) NOT NULL
);

ALTER TABLE students ADD CONSTRAINT student_pk PRIMARY KEY (document_number);

-- Programas
CREATE TABLE programs (
    program_id VARCHAR2(20),
    name       VARCHAR2(100) NOT NULL,
    duration   NUMBER(2) NOT NULL
);

ALTER TABLE programs ADD CONSTRAINT program_pk PRIMARY KEY (program_id);

-- Periodos académicos
CREATE TABLE academics_terms (
    academic_term_id VARCHAR2(20),
    year             NUMBER(4) NOT NULL,
    start_date       DATE NOT NULL,
    end_date         DATE NOT NULL
);

ALTER TABLE academics_terms ADD CONSTRAINT academic_term_pk PRIMARY KEY (academic_term_id);

-- Catálogo de estados de matrícula
CREATE TABLE statuses (
    name VARCHAR2(20)
);

ALTER TABLE statuses ADD CONSTRAINT status_pk PRIMARY KEY (name);

-- Materias
CREATE TABLE subjects (
    subject_id VARCHAR2(20),
    name       VARCHAR2(100) NOT NULL
);

ALTER TABLE subjects ADD CONSTRAINT subject_pk PRIMARY KEY (subject_id);

-- Docentes de la institución
CREATE TABLE teachers (
    document_number VARCHAR2(20),
    full_name       VARCHAR2(100) NOT NULL,
    document_type   VARCHAR2(5) NOT NULL,
    address         VARCHAR2(150) NOT NULL,
    email           VARCHAR2(120) NOT NULL,
    phone           VARCHAR2(15) NOT NULL
);

ALTER TABLE teachers ADD CONSTRAINT teacher_pk PRIMARY KEY (document_number);

-- Matrículas por estudiante, programa y periodo y los datos de retiro son opcionales
CREATE TABLE enrollments (
    academic_term_academic_term_id VARCHAR2(20) NOT NULL,
    enrollment_id                  VARCHAR2(20),
    semester_number                NUMBER(2) NOT NULL,
    status_name                    VARCHAR2(20) NOT NULL,
    withdrawal_date                DATE,
    withdrawal_reason              VARCHAR2(100),
    student_document_number        VARCHAR2(20) NOT NULL,
    program_program_id             VARCHAR2(20) NOT NULL
);

ALTER TABLE enrollments ADD CONSTRAINT enrollment_pk PRIMARY KEY (enrollment_id);

-- Materias de cada programa y su semestre
CREATE TABLE programs_subjects (
    program_program_id VARCHAR2(20),
    subject_subject_id VARCHAR2(20),
    semester           NUMBER(2) NOT NULL
);

ALTER TABLE programs_subjects ADD CONSTRAINT program_subject_pk PRIMARY KEY (program_program_id, subject_subject_id);

-- Grupos por materia del programa, docente y periodo
CREATE TABLE groups (
    academic_term_academic_term_id     VARCHAR2(20) NOT NULL,
    teacher_document_number            VARCHAR2(20) NOT NULL,
    program_subject_program_program_id VARCHAR2(20) NOT NULL,
    program_subject_subject_subject_id VARCHAR2(20) NOT NULL,
    nrc                                VARCHAR2(10)
);

ALTER TABLE groups ADD CONSTRAINT group_pk PRIMARY KEY (nrc);

-- Asignaciones de matrículas a grupos
CREATE TABLE enrollments_groups (
    group_nrc                VARCHAR2(10),
    enrollment_enrollment_id VARCHAR2(20)
);

ALTER TABLE enrollments_groups ADD CONSTRAINT enrollment_group_pk PRIMARY KEY (group_nrc, enrollment_enrollment_id);

-- Actividades evaluativas de los grupos
CREATE TABLE activities (
    activity_id   VARCHAR2(20),
    name          VARCHAR2(30) NOT NULL,
    percentage    NUMBER(5, 2) NOT NULL,
    group_nrc     VARCHAR2(10) NOT NULL,
    activity_date DATE NOT NULL
);

ALTER TABLE activities ADD CONSTRAINT activity_pk PRIMARY KEY (activity_id);

-- Calificaciones por actividad y asignación a grupo
CREATE TABLE activities_grades (
    activities_activity_id                    VARCHAR2(20),
    grade                                     NUMBER(3, 2) NOT NULL,
    enrollment_group_id_enrollment_group      VARCHAR2(20),
    enrollment_group_group_nrc                VARCHAR2(10) NOT NULL,
    enrollment_group_enrollment_enrollment_id VARCHAR2(20) NOT NULL
);

ALTER TABLE activities_grades ADD CONSTRAINT activity_grade_pk PRIMARY KEY (enrollment_group_id_enrollment_group, activities_activity_id);

-- Asistencia por asignación a grupo y fecha
CREATE TABLE attendances (
    attendance_id                             VARCHAR2(20),
    attendance_date                           DATE NOT NULL,
    attended                                  VARCHAR2(1) NOT NULL,
    enrollment_group_group_nrc                VARCHAR2(10) NOT NULL,
    enrollment_group_enrollment_enrollment_id VARCHAR2(20) NOT NULL
);

ALTER TABLE attendances ADD CONSTRAINT attendance_pk PRIMARY KEY (attendance_id);

-- Graduaciones por estudiante y programa
CREATE TABLE graduates (
    graduation_date         DATE NOT NULL,
    certificate_number      VARCHAR2(30) NOT NULL,
    certificate_document    VARCHAR2(255) NOT NULL,
    student_document_number VARCHAR2(20),
    program_program_id      VARCHAR2(20)
);

ALTER TABLE graduates ADD CONSTRAINT graduated_pk PRIMARY KEY (student_document_number, program_program_id);

-- Experiencia laboral asociada a estudiantes
CREATE TABLE works_experiences (
    experience_id           VARCHAR2(20),
    company_name            VARCHAR2(100) NOT NULL,
    position                VARCHAR2(100) NOT NULL,
    student_document_number VARCHAR2(20) NOT NULL
);

ALTER TABLE works_experiences ADD CONSTRAINT work_experience_pk PRIMARY KEY (experience_id);



-- UNIQUIES
ALTER TABLE enrollments ADD CONSTRAINT enrollment__un UNIQUE (student_document_number, academic_term_academic_term_id, program_program_id);
ALTER TABLE graduates ADD CONSTRAINT graduated__un UNIQUE (certificate_number);
--Indica que el estudiante solo pueda tener una experiencia de trabajo
CREATE UNIQUE INDEX work_experience__idx ON works_experiences (student_document_number);

-- CHECKS

-- Materias y grupos: el semestre de una materia dentro de un programa debe ser 1 o mayor
ALTER TABLE programs_subjects ADD CONSTRAINT program_subject_semester_ck CHECK (semester >= 1);
-- Materias y grupos: los docentes solo pueden tener cédula de ciudadanía, cédula de extranjería o pasaporte
ALTER TABLE teachers ADD CONSTRAINT teacher_document_type_ck CHECK (document_type IN ('CC', 'CE', 'PA'));
-- Materias y grupos: el correo del docente debe tener una arroba y un punto después de ella
ALTER TABLE teachers ADD CONSTRAINT teacher_email_ck CHECK (email LIKE '%_@_%._%');


-- FOREIGN KEYS
ALTER TABLE enrollments ADD CONSTRAINT enrollment_academic_term_fk FOREIGN KEY (academic_term_academic_term_id) REFERENCES academics_terms (academic_term_id);
ALTER TABLE enrollments ADD CONSTRAINT enrollment_program_fk FOREIGN KEY (program_program_id) REFERENCES programs (program_id);
ALTER TABLE enrollments ADD CONSTRAINT enrollment_status_fk FOREIGN KEY (status_name) REFERENCES statuses (name);
ALTER TABLE enrollments ADD CONSTRAINT enrollment_student_fk FOREIGN KEY (student_document_number) REFERENCES students (document_number);
ALTER TABLE programs_subjects ADD CONSTRAINT program_subject_program_fk FOREIGN KEY (program_program_id) REFERENCES programs (program_id);
ALTER TABLE programs_subjects ADD CONSTRAINT program_subject_subject_fk FOREIGN KEY (subject_subject_id) REFERENCES subjects (subject_id);
ALTER TABLE groups ADD CONSTRAINT group_academic_term_fk FOREIGN KEY (academic_term_academic_term_id) REFERENCES academics_terms (academic_term_id);
ALTER TABLE groups ADD CONSTRAINT group_program_subject_fk FOREIGN KEY (program_subject_program_program_id, program_subject_subject_subject_id) REFERENCES programs_subjects (program_program_id, subject_subject_id);
ALTER TABLE groups ADD CONSTRAINT group_teacher_fk FOREIGN KEY (teacher_document_number) REFERENCES teachers (document_number);
ALTER TABLE enrollments_groups ADD CONSTRAINT enrollment_group_enrollment_fk FOREIGN KEY (enrollment_enrollment_id) REFERENCES enrollments (enrollment_id);
ALTER TABLE enrollments_groups ADD CONSTRAINT enrollment_group_group_fk FOREIGN KEY (group_nrc) REFERENCES groups (nrc);
ALTER TABLE activities ADD CONSTRAINT activity_group_fk FOREIGN KEY (group_nrc) REFERENCES groups (nrc);
ALTER TABLE activities_grades ADD CONSTRAINT activity_grade_activity_fk FOREIGN KEY (activities_activity_id) REFERENCES activities (activity_id);
ALTER TABLE activities_grades ADD CONSTRAINT activity_grade_enrollment_group_fk FOREIGN KEY (enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) REFERENCES enrollments_groups (group_nrc, enrollment_enrollment_id);
ALTER TABLE attendances ADD CONSTRAINT attendance_enrollment_group_fk FOREIGN KEY (enrollment_group_group_nrc, enrollment_group_enrollment_enrollment_id) REFERENCES enrollments_groups (group_nrc, enrollment_enrollment_id);
ALTER TABLE graduates ADD CONSTRAINT graduated_program_fk FOREIGN KEY (program_program_id) REFERENCES programs (program_id);
ALTER TABLE graduates ADD CONSTRAINT graduated_student_fk FOREIGN KEY (student_document_number) REFERENCES students (document_number);
ALTER TABLE works_experiences ADD CONSTRAINT work_experience_student_fk FOREIGN KEY (student_document_number) REFERENCES students (document_number);

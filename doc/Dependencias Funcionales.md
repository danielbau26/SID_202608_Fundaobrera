# Dependencias funcionales – Fundaobrera

Listado de dependencias funcionales (DF) obtenidas del enunciado del caso *Sistema de Gestión del Historial Académico de Estudiantes de Fundaobrera*. Los nombres de atributos siguen los del Modelo Relacional (MR de Fundaobrera).

Notación: `X → Y` significa que un valor de X determina un único valor de Y.

---

## 1. PROGRAM (Programa)

> "Los programas deben ser registrados mediante un identificador único, un nombre y duración del programa."

| # | Dependencia funcional |
|---|---|
| DF1 | `program_id → name, duration` |

---

## 2. SUBJECT (Materia)

> "Cada materia debe registrarse mediante un identificador único y un nombre."

| # | Dependencia funcional |
|---|---|
| DF2 | `subject_id → name` |

---

## 3. PROGRAM_SUBJECT (Materia en un programa)

> "Para cada materia asociada a un programa se debe registrar el semestre en el que debe ser cursada."

| # | Dependencia funcional |
|---|---|
| DF3 | `program_id, subject_id → semester` |

---

## 4. STUDENT (Estudiante)

> "El número de documento debe ser único para cada estudiante."

| # | Dependencia funcional |
|---|---|
| DF4 | `document_number → full_name, document_type, birth_date, phone, address, email, stratum` |

---

## 5. WORK_EXPERIENCE (Experiencia laboral)

> "Cuando trabaje, se registrará la empresa y el cargo que desempeña, solo de su experiencia actual."

| # | Dependencia funcional |
|---|---|
| DF5 | `experience_id → company_name, position, student_document_number` |
| DF6 | `student_document_number → experience_id, company_name, position` |

*Como solo se guarda la experiencia actual, cada estudiante tiene como máximo una; por eso `student_document_number` también es clave candidata (relación 1:0..1).*

---

## 6. TEACHER (Profesor)

| # | Dependencia funcional |
|---|---|
| DF7 | `document_number → full_name, document_type, address, email, phone` |

---

## 7. ACADEMIC_TERM (Periodo académico)

> "Cada periodo académico debe contar con un identificador único, año, fecha de inicio y fecha de finalización."

| # | Dependencia funcional |
|---|---|
| DF8 | `academic_term_id → year, start_date, end_date` |

---

## 8. GROUP (Grupo)

> "Un NRC único para todo el sistema, el cual no se reutilizará en periodos posteriores, la materia, el programa, el semestre, el periodo académico y el profesor que la dictará."

| # | Dependencia funcional |
|---|---|
| DF9 | `nrc → program_id, subject_id, academic_term_id, teacher_document_number` |
| DF10 | `nrc → semester` *(transitiva: `nrc → program_id, subject_id` y DF3 `program_id, subject_id → semester`)* |

*El semestre no se guarda en GROUP porque se obtiene por transitividad desde PROGRAM_SUBJECT; guardarlo violaría la 3FN.*

---

## 9. ACTIVITY (Actividad evaluativa)

> "Cada grupo tendrá varias actividades evaluativas, de las cuales se registrará un identificador único, el nombre, el porcentaje y la fecha."

| # | Dependencia funcional |
|---|---|
| DF11 | `activity_id → name, percentage, activity_date, group_nrc` |

---

## 10. STATUS (Estado de matrícula)

| # | Dependencia funcional |
|---|---|
| DF12 | `name → name` *(trivial; tabla catálogo: cursando, retirado)* |

---

## 11. ENROLLMENT (Matrícula)

> "La secretaría debe crear una matrícula indicando el estudiante, el programa de formación, semestre y el periodo académico… Un estudiante no puede tener más de una matrícula para el mismo programa y periodo académico."
> "Una matrícula en estado retirado debe tener la fecha del retiro y el motivo."

| # | Dependencia funcional |
|---|---|
| DF13 | `enrollment_id → student_document_number, program_id, academic_term_id, semester_number, status_name, withdrawal_date, withdrawal_reason` |
| DF14 | `student_document_number, program_id, academic_term_id → enrollment_id` *(clave candidata)* |
| DF15 | `student_document_number, program_id, academic_term_id → semester_number, status_name, withdrawal_date, withdrawal_reason` *(se deduce de DF14 y DF13)* |

*`withdrawal_date` y `withdrawal_reason` solo tienen valor cuando `status_name = 'retirado'` (restricción de negocio, no DF).*

---

## 12. GRADUATED (Graduado)

> "Cuando el estudiante se gradúe, se registrará la fecha de graduación, número de acta y documento del acta de grado (pdf)."

| # | Dependencia funcional |
|---|---|
| DF16 | `student_document_number, program_id → graduation_date, certificate_number, certificate_document` |
| DF17 | `certificate_number → student_document_number, program_id, graduation_date, certificate_document` *(número de acta único → clave candidata)* |

---

## 13. ENROLLMENT_GROUP (Inscripción a grupo)

> "Por cada materia que el estudiante curse en una matrícula, se creará una inscripción al grupo asignado… Un estudiante solo podrá estar asignado a un grupo por cada materia dentro de una matrícula."

| # | Dependencia funcional |
|---|---|
| DF18 | `id_enrollment_group → enrollment_id, group_nrc` |
| DF19 | `enrollment_id, group_nrc → id_enrollment_group` *(clave candidata)* |
| DF20 | `enrollment_id, subject_id → group_nrc` *(un solo grupo por materia dentro de la matrícula; `subject_id` se obtiene de `group_nrc` por DF9)* |

---

## 14. ACTIVITY_GRADE (Nota de actividad)

> "Cada actividad tendrá una nota por cada estudiante inscrito en el grupo."

| # | Dependencia funcional |
|---|---|
| DF21 | `id_enrollment_group, activity_id → grade` |

---

## 15. ATTENDANCE (Asistencia)

> "Los profesores deberán registrar la asistencia de los estudiantes en cada clase indicando el grupo, la fecha y si el estudiante asistió o no."

| # | Dependencia funcional |
|---|---|
| DF22 | `attendance_id → id_enrollment_group, attendance_date, attended` |
| DF23 | `id_enrollment_group, attendance_date → attended, attendance_id`  |

---
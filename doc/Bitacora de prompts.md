Bitácora de prompts de ChatGPT

# FASE 1: Concepción y Modelado Inicial

### Prompt 1: Entidades fundamentales del dominio académico
* **Pregunta del estudiante:**  
  > *"Estoy modelando el historial académico ¿Qué entidades típicas no debería olvidar en un modelo de estudiantes, matrículas y calificaciones?"*
* **Respuesta de la IA:**  
  Explicación detallada diferenciando entidades de relaciones. Se definieron: `ESTUDIANTE`, `PROGRAMA`, `MATERIA`, `PROGRAMA_MATERIA`, `PERIODO_ACADÉMICO`, `MATRÍCULA`, `GRUPO`, `DOCENTE`, `DETALLE_MATRÍCULA`, `CALIFICACIÓN`, `ASISTENCIA`, `PAGO` y `ESTADO`.

### Prompt 2: Separación de ENROLLMENT y DETAIL_ENROLLMENT
* **Pregunta del estudiante:**  
  > *"¿Tiene sentido que ENROLLMENT y DETAIL_ENROLLMENT sean entidades separadas, o debería fusionarlas? ¿Qué ventajas tiene separarlas?"*
* **Respuesta de la IA:**  
  Confirmación de la separación por relación 1:N. Se argumentó que `ENROLLMENT` representa la cabecera del semestre y `DETAIL_ENROLLMENT` la inscripción por materia/grupo, evitando redundancia de datos generales y manteniendo la 3NF.

### Prompt 3: Repetición de materias e historial
* **Pregunta del estudiante:**  
  > *"¿Cómo se modela normalmente la relación entre estudiante, programa y semestre cuando un estudiante puede repetir materias?"*
* **Respuesta de la IA:**  
  Modelado mediante la creación de un nuevo `DETAIL_ENROLLMENT` asociado a una nueva `ENROLLMENT` por cada periodo/semestre. Esto evita la pérdida de información histórica al no sobrescribir calificaciones previas.

### Prompt 4: Patrones para Graduación y Retiro
* **Pregunta del estudiante:**  
  > *"¿GRADUATED y WITHDRAWAL deberían ser subtipos de una entidad ACTIVE/estado del estudiante, o entidades independientes? ¿Qué patrón de modelado aplica acá?"*
* **Respuesta de la IA:**  
  Aplicación del patrón Supertipo/Subtipo (Especialización) sobre `ENROLLMENT` o vinculación con atributos opcionales/entidades debilidades para almacenar atributos exclusivos (como `withdrawal_reason` o `certificate_document`).

---

# FASE 2: Ajuste de Requerimientos, MER Corregido, Normalización (3NF) y Dependencias Funcionales

### Prompt 5: Normalización a 3NF y Análisis de Dependencias Funcionales (DF)
* **Pregunta del estudiante:**  
  > *"Oye bro, necesito sacar las Dependencias Funcionales del modelo relacional para justificar que está en 3NF. ¿Cómo expreso formalmente las DF de tablas como `ENROLLMENT_GROUP`, `ACTIVITY_GRADE` y `PROGRAM_SUBJECT` para que el profe no me ponga problema?"*
* **Respuesta de la IA:**  
  > *"¡Claro! Para justificar la 3NF debes demostrar que cada atributo no clave depende de manera funcional completa de la clave primaria (2NF) y de manera no transitiva (3NF).*
  > 
  > *Aquí tienes la especificación formal:*
  > * 1. **`PROGRAM_SUBJECT`**: `{program_id, subject_id} -> {semester}`. La clave es compuesta; el semestre depende de la combinación exacta de programa y materia.*
  > * 2. **`ENROLLMENT_GROUP`**: `{id_enrollment_group} -> {grade, enrollment_id, nrc}`. `id_enrollment_group` es la Clave Primaria Sintética. Además, existe la Clave Candidata/Única `{enrollment_id, nrc} -> {id_enrollment_group, grade}`, garantizando que un estudiante no se inscriba dos veces al mismo grupo.*
  > * 3. **`ACTIVITY_GRADE`**: `{id_enrollment_group, activity_id} -> {grade}`. La nota de una actividad depende directamente de la inscripción específica del estudiante al grupo y de la actividad evaluativa correspondiente.*
  > * 4. **`GRADUATED`**: `{student_document_number, program_id} -> {graduation_date, certificate_number, certificate_document}`. La graduación depende únicamente de la pareja estudiante-programa.*
  > 
  > *Todas las determinantes son Claves Candidatas o Superclaves, cumpliendo formalmente con la Tercera Forma Normal (3NF)."*

---

### Prompt 6: Corrección de Criterios de Aceptación Gherkin para Historias de Usuario
* **Pregunta del estudiante:**  
  > *"Parse, estamos ajustando las Historias de Usuario para la entrega final del caso Fundaobrera. ¿Cómo estructuro los escenarios de 'Matricular estudiante', 'Registrar nota de actividad' y 'Registrar graduación' en formato Gherkin exacto para que coincidan con la base de datos?"*
* **Respuesta de la IA:**  
  > *"Para que las Historias de Usuario se alineen con la lógica de la base de datos, estructuramos los escenarios `Given-When-Then` integrando las restricciones reales del modelo:*
  > 
  > **HU: Registrar matrícula de estudiante**
  > * **Scenario: Matrícula exitosa con generación automática de asignaturas**  
  >   * **Given** el estudiante y el programa existen en el sistema y no hay una matrícula previa activa para el mismo `academic_term_id`.
  >   * **When** el/la secretario/a registra la matrícula para un semestre específico.
  >   * **Then** el sistema crea el registro en `ENROLLMENT` con estado `'CURSANDO'`, calcula la tarifa correspondiente y asocia automáticamente las materias de `PROGRAM_SUBJECT`.
  > 
  > **HU: Registrar calificaciones por actividad**
  > * **Scenario: Registro de nota válido**  
  >   * **Given** el profesor tiene asignado el grupo (`nrc`) y la actividad existe en `ACTIVITY`.
  >   * **When** ingresa una calificación entre `0.0` y `5.0` para un estudiante inscrito.
  >   * **Then** el sistema almacena la nota en `ACTIVITY_GRADE` y recalcula la nota definitiva en `ENROLLMENT_GROUP`.
  > 
  > **HU: Registrar graduación de estudiante**
  > * **Scenario: Graduación válida con documento PDF**  
  >   * **Given** el estudiante tiene la matrícula activa en el programa.
  >   * **When** el/la secretario/a registra la fecha, número de acta y adjunta el archivo en formato PDF.
  >   * **Then** el sistema crea la entrada en `GRADUATED` y cambia el estado de la matrícula en `STATUS`."*

---

### Prompt 7: Correcciones del Modelo Entidad-Relación (MER PDF)
* **Pregunta del estudiante:**  
  > *"El profesor nos pidió corregir el MER para que no haya ambigüedad entre las actividades, los grupos y los profesores. ¿Cómo debe ser la jerarquía visual del MER de Fundaobrera?"*
* **Respuesta de la IA:**  
  Reestructuración conceptual del diagrama:
  1. `TEACHER` enseña (`teaches`) `GROUP`.
  2. `GROUP` contiene (`has`) múltiples `ACTIVITY`.
  3. `ENROLLMENT_GROUP` relaciona `ENROLLMENT` y `GROUP`.
  4. `ACTIVITY_GRADE` conecta `ENROLLMENT_GROUP` con `ACTIVITY`.
  5. `ATTENDANCE` se vincula directamente a `ENROLLMENT_GROUP` para registrar la presencia del estudiante por clase.

---

# FASE 3: Implementación SQL y PL/SQL

Las entradas indicadas como reconstruidas resumen el trabajo realizado. Los prompts sugeridos se acompañan de respuestas resumidas reconstruidas durante la revisión del proyecto. Las fases anteriores conservan las respuestas históricas, que pueden diferir del modelo final.

### Prompt 8: DDL general y módulo de Matrículas (prompt consolidado)

* **Pregunta del estudiante:**

  > *"Apartir del modelo MR adjuntado, ayúdame a crear los scripts de Oracle. En src/01_ddl.sql, crea las 15 tablas del proyecto, documenta la finalidad de cada una, coloca los DROP TABLE activos al inicio en orden de dependencias, agrega la clave primaria con ALTER TABLE justo después de crear cada tabla y deja todas las claves foráneas al final, una por línea. En src/02_dml.sql, agrega solo los datos ficticios de mi módulo y sus tablas compartidas. Carga 12 estudiantes, 5 programas, 2 periodos y 12 matrículas en estado cursando, distribuidas en 10 combinaciones de programa y periodo para que cada reporte devuelva al menos 10 filas. En src/03_dql.sql, agrega solo mis dos reportes y comenta en lenguaje natural qué hace cada consulta. En el primero usa JOIN para listar los estudiantes matriculados por programa con una fila por estudiante y programa. En el segundo, usa LEFT JOIN para contar los estudiantes por programa y periodo académico."*

* **Respuesta de la IA:**

  Usé ChatGPT para generar y ajustar los scripts 01_ddl.sql, 02_dml.sql y 03_dql.sql a partir del modelo relacional que corregí en Data Modeler. Lo usé para traducir el modelo a SQL y preparar datos que cubrieran los dos reportes de Matrículas. Durante la revisión, pedí conservar los nombres del modelo, reorganizar las claves y ajustar los tipos de JOIN. Se comprobó que los inserts cubren 12 estudiantes y 10 combinaciones de programa y periodo.

---

### Prompt 9: Revisión de reglas de integridad del DDL (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Te paso el DDL completo de nuestro esquema [pegar]. Actúa como revisor de bases de datos y lista las reglas del enunciado [pegar enunciado] que el DDL no está garantizando. Para cada una propón un CHECK, un UNIQUE o un trigger, y explica por qué elegiste ese mecanismo."*

* **Respuesta de la IA:**

  Se propuso agregar un CHECK para limitar las notas al rango de 0 a 5, una restricción UNIQUE para impedir dos notas de la misma actividad en una inscripción y una clave foránea compuesta para garantizar que la actividad pertenezca al grupo. Para las reglas que relacionan programa y periodo entre tablas se revisó el uso de triggers. La revisión también identificó el problema de consultar enrollments_groups desde su propio trigger por fila.

---

### Prompt 10: Coherencia de las dependencias funcionales con el DDL (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Revisa si estas dependencias funcionales [pegar] son consistentes con este DDL [pegar]. Señala contradicciones entre ambos documentos."*

* **Respuesta de la IA:**

  Se señaló que la inscripción a un grupo está identificada en el DDL por la pareja grupo y matrícula, mientras que algunos ejemplos anteriores de dependencias funcionales usaban un identificador sintético. Se recomendó alinear las dependencias con las claves reales del modelo. También se confirmó que la unicidad del documento en works_experiences corresponde a la regla de conservar únicamente la experiencia laboral actual.

---

### Prompt 11: Generación de datos de prueba (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Genera INSERT para Oracle sobre estas tablas [pegar DDL] con estas condiciones: al menos 10 registros por reporte, fechas dentro de los periodos académicos, y casos borde (un programa sin estudiantes en un periodo, una materia con nota menor a 3.0). Antes de los INSERT, dime qué resultado esperado debería dar cada reporte con esos datos."*

* **Respuesta de la IA:**

  Se planteó cargar primero programas, periodos, estados y estudiantes, y luego matrículas, grupos e inscripciones, respetando las claves foráneas. Para comprobar los reportes se incluyeron casos de aprobación y no aprobación, matrículas retiradas y graduadas, y una inscripción sin asistencia. Los conteos calculados sobre los inserts permiten anticipar al menos diez filas por reporte; la ejecución en Oracle sigue siendo la comprobación final. La carga de 2025 requiere completar grupos y notas si se desea mostrar el historial académico de esos estudiantes.

---

### Prompt 12: Promedio por programa y periodo (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Con este esquema [pegar], escribe la consulta para el reporte 'promedio académico por programa y periodo'. Debe usar al menos un LEFT JOIN y GROUP BY. Explica qué pasaría con los programas sin notas si usara INNER JOIN, y dame el resultado esperado con estos datos [pegar inserts]."*

* **Respuesta de la IA:**

  Se explicó que LEFT JOIN conserva las matrículas aunque todavía no tengan grupos asignados. AVG calcula el promedio de las notas disponibles y devuelve NULL cuando no hay notas, mientras que COUNT de la nota devuelve cero en ese caso. En la revisión posterior se acordó agrupar por estudiante, programa y periodo para cumplir el reporte individual. Si se usa JOIN hacia las inscripciones, las matrículas sin grupos desaparecen. Con los inserts revisados se esperan 32 filas para la versión individual.

---

### Prompt 13: Revisión lógica de consultas (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Te paso mi consulta [pegar]. Encuentra errores lógicos, casos en que devolvería filas duplicadas o resultados incorrectos, y propón una versión corregida."*

* **Respuesta de la IA:**

  Se recomendó comprobar qué representa cada fila antes de añadir DISTINCT o GROUP BY. Para listar estudiantes por programa se usó DISTINCT, porque las matrículas de distintos periodos pueden repetir al mismo estudiante. En los conteos se utilizó COUNT(DISTINCT documento). También se revisó que el TOP 10 corresponda a promedios históricos y que las matrículas sin notas se identifiquen con NULL, evitando interpretarlas como una nota de cero.

---

### Prompt 14: Depuración de scripts (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Ejecuté estos scripts en este orden y obtuve estos errores [pegar salida completa]. Explícame la causa raíz (no cada error por separado) y el orden correcto para corregirlo, sin borrar datos que no sean del proyecto."*

* **Respuesta de la IA:**

  Se identificó que un punto y coma antes de FOR UPDATE cerraba el SELECT y provocaba un error de compilación. Se corrigió colocando FOR UPDATE antes del punto y coma final. Se indicó ejecutar DDL, DML, PL/SQL y DQL, ya que las consultas de notas y asistencia utilizan funciones. Los errores de DROP TABLE en un esquema vacío deben distinguirse de errores en la creación de objetos. Cada corrección debe recompilarse y probarse en Oracle.

---

### Prompt 15: Revisión crítica de una respuesta de IAg (prompt sugerido)

* **Pregunta del estudiante:**

  > *"Esta es la respuesta que me diste antes [pegar]. Actúa como un profesor exigente de bases de datos y critícala: ¿qué supuestos hiciste que no están en el enunciado? ¿Qué podría estar mal?"*

* **Respuesta de la IA:**

  Se señaló que los umbrales de aprobación de 3.0 y de asistencia del 80 % deben confirmarse como reglas del proyecto. También se aclaró que una nota ponderada con evaluaciones faltantes representa un acumulado, aunque la función la denomine definitiva. El equipo decidió conservar ese cálculo y conoce su limitación. Se revisó además que las respuestas históricas que mencionan pagos o claves sintéticas pueden diferir del alcance y del modelo finales.

---

### Prompt 16: Riesgos de ejecución en producción (prompt sugerido)

* **Pregunta del estudiante:**

  > *"¿Qué riesgos tiene usar en producción el comando que me sugeriste? ¿Qué debería verificar antes de ejecutarlo?"*

* **Respuesta de la IA:**

  Para un comando destructivo como DROP TABLE, se explicó que elimina la tabla y sus datos y confirma la transacción, por lo que no se revierte con ROLLBACK. Antes de ejecutarlo se debe comprobar la conexión, el esquema, las tablas afectadas, sus dependencias y la posibilidad de recuperar los datos. El bloque de borrado del proyecto está pensado para recrear el esquema de pruebas. En producción se requiere planificar el cambio y su recuperación según los procedimientos de la organización.

---

### Prompt 17: Consultas de Materias y grupos (prompt reconstruido)

* **Pregunta del estudiante:**

  > *"Estoy haciendo la parte de materias y grupos del proyecto Fundaobrera en Oracle. Necesito la consulta para ver qué materias cursó cada estudiante, mostrando su nombre, programa, periodo, materia, NRC y profesor. Tenemos students, enrollments, enrollments_groups, groups, subjects y teachers. Ayúdame a relacionarlas con join y que salga ordenado por estudiante, periodo y materia. Ponle un comentario explicando qué muestra y explícame cómo se llega del estudiante hasta la materia."*

* **Respuesta de la IA:**

  Resumen del apoyo recibido: se relacionaron estudiantes, matrículas, programas, periodos, inscripciones, grupos, materias y docentes mediante JOIN. La consulta muestra las materias de las matrículas con grupos asignados y se ordena por estudiante, periodo y materia.

---

### Prompt 18: Consultas de Calificaciones (prompt reconstruido)

* **Pregunta del estudiante:**

  > *"Me toca la parte de calificaciones de Fundaobrera. Ya tenemos la función fn_final_grade que recibe el grupo y la matrícula y calcula la nota. Necesito las consultas de notas por estudiante, promedio de cada estudiante por programa y periodo, materias aprobadas y no aprobadas y un top 10 de mejores promedios históricos. Usa 3 como nota mínima para aprobar. En los promedios quiero que también aparezcan las matrículas sin notas, y en el reporte de aprobación que se distinga si no tiene materias o si le faltan calificaciones. Pon comentarios y ordena los resultados para que se entiendan al mostrarlos."*

* **Respuesta de la IA:**

  Resumen del apoyo recibido: se prepararon los reportes de notas, promedios individuales por programa y periodo, clasificación de aprobación y TOP 10 histórico. Se usaron fn_final_grade, AVG, GROUP BY, CASE, LEFT JOIN y FETCH FIRST. Se mantuvo NULL cuando no hay notas. La revisión identificó que la función puede devolver un acumulado si faltan evaluaciones y el equipo decidió conservar ese comportamiento.

---

### Prompt 19: Consultas de Estado académico (prompt reconstruido)

* **Pregunta del estudiante:**

  > *"Estoy con el módulo de estado académico del proyecto. Los estados de las matrículas son cursando, retirado y graduado. Necesito una consulta que cuente los estudiantes por programa y estado, otra que muestre los retirados con la fecha y el motivo y otra de graduados con su fecha y los datos del acta. Usa las tablas que ya tenemos en el modelo. En el conteo quiero que aparezca cero cuando un programa no tenga estudiantes en algún estado. Agrega comentarios y un orden que sirva para revisar los resultados."*

* **Respuesta de la IA:**

  Resumen del apoyo recibido: se usaron CROSS JOIN y LEFT JOIN para contar estudiantes por programa y estado, incluyendo combinaciones con cero estudiantes. Se prepararon también los reportes detallados de retiros y graduaciones con JOIN hacia estudiantes y programas.

---

### Prompt 20: Consulta de Asistencia (prompt reconstruido)

* **Pregunta del estudiante:**

  > *"Me falta la consulta de asistencia de Fundaobrera. Ya existe fn_attendance_percentage, que recibe el NRC y la matrícula. Quiero mostrar el estudiante, periodo, materia, grupo, docente y porcentaje de asistencia. Si no tiene registros que diga “Sin registros”, y con el umbral del 80 % que estamos usando que muestre “Cumple” o “En riesgo”. Ayúdame con los joins, pon un comentario que explique el cálculo y ordena por estudiante, periodo y materia."*

* **Respuesta de la IA:**

  Resumen del apoyo recibido: se relacionaron las inscripciones con estudiantes, matrículas, periodos, grupos, materias y docentes. Se utilizó fn_attendance_percentage para calcular el porcentaje y CASE para mostrar Sin registros, Cumple o En riesgo. El umbral del 80 % se identificó como una regla que el equipo debe confirmar.

---

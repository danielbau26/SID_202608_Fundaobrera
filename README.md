# SID_202608_Fundaobrera

## Descripción del proyecto

Este repositorio contiene el desarrollo del proyecto de la asignatura Sistemas Intensivos en Datos.

El proyecto tiene como objetivo diseñar una base de datos para el Sistema de Gestión del Historial Académico de Estudiantes de Fundaobrera, institución ubicada en Cali que ofrece programas técnicos laborales.

Actualmente, gran parte de la información relacionada con estudiantes, programas, materias, matrículas, calificaciones y demás procesos académicos es gestionada de manera manual por la secretaría académica. Esto dificulta la consulta del historial académico de los estudiantes, aumenta el tiempo empleado en la búsqueda de información y genera riesgos de pérdida de datos y errores humanos.

Por esta razón, se plantea una base de datos centralizada para almacenar, organizar y consultar la información académica de la institución.

## Funcionalidades principales

El sistema contempla la gestión de:

- Programas académicos.
- Materias.
- Periodos académicos.
- Estudiantes.
- Matrículas.
- Profesores.
- Grupos.
- Asignación de estudiantes a grupos.
- Calificaciones.
- Asistencia.
- Estados académicos de los estudiantes.
- Consultas e informes académicos.

## Integrantes

- [Santiago Samboni Cordoba](https://github.com/samboni72) · A00411900
- [Daniel Felipe Bautista Sanchez](https://github.com/danielbau26) · A00411481
- [Jhoan Esteban Delgado Mejia](https://github.com/jhoandm57) · A00410954
- [Jeanfer Stiven Rivera](https://github.com/Jeanfer224) · A00412281
- [Juan David Meza Castro](https://github.com/juanmeza850) · A00411450

## Estructura del repositorio

### `doc`

Contiene la documentación relacionada con el proyecto.

- [Descripción del caso de estudio](doc/Descripci%C3%B3n%20del%20caso.md)
- [Historias de usuario](doc/Historias%20de%20usuario.md)
- [Dependencias funcionales](doc/Dependencias%20Funcionales.md)
- [Acuerdos de trabajo en equipo](doc/Acuerdos%20de%20trabajo.md)
- [Bitácora de reuniones](doc/Bitacora%20de%20reuniones.md)
- [Bitácora de prompts](doc/Bitacora%20de%20prompts.md)
- [Riesgos del uso de IAg](doc/Riesgos%20del%20uso%20de%20IAg.md)

#### Actas de reunión

- [Acta n.º 1 (PDF)](doc/actas/Acta%20de%20Reunion%20No.1.pdf)
- [Acta n.º 2 (PDF)](doc/actas/Acta%20de%20Reunion%20No.2.pdf)
- [Acta n.º 3 (PDF)](doc/actas/Acta%20de%20Reunion%20No.3.pdf)
- [Acta n.º 4 (PDF)](doc/actas/Acta%20de%20Reunion%20No.4.pdf)
- [Acta n.º 5 (PDF)](doc/actas/Acta%20de%20Reunion%20No.5.pdf)
- [Acta n.º 6 (PDF)](doc/actas/Acta%20de%20Reunion%20No.6.pdf)
- [Acta n.º 7 (PDF)](doc/actas/Acta%20de%20Reunion%20No.7.pdf)
- [Acta n.º 8 (PDF)](doc/actas/Acta%20de%20Reunion%20No.8.pdf)
- [Acta n.º 9 (PDF)](doc/actas/Acta%20de%20Reunion%20No.9.pdf)

### `model`

Contiene los modelos de datos desarrollados durante el proyecto.

- [Modelo Entidad-Relación (MER) en PDF](model/MER%20de%20Fundaobrera.pdf)
- [Modelo relacional (MR) en PDF](model/MR%20de%20Fundaobrera.pdf)
- [Diseño de Oracle SQL Developer Data Modeler (.dmd)](model/PROYECTO%20DE%20FUNDAOBRERA.dmd)

### `src`

| Script | Contenido |
| --- | --- |
| [`01_ddl.sql`](src/01_ddl.sql) | Define las 15 tablas del modelo relacional y sus restricciones. |
| [`02_dml.sql`](src/02_dml.sql) | Carga datos ficticios de matrículas, materias y grupos, calificaciones, estados académicos y asistencia. |
| [`03_dql.sql`](src/03_dql.sql) | Contiene once reportes con joins, agrupamiento, ordenamiento y un TOP 10. |
| [`04_plsql.sql`](src/04_plsql.sql) | Contiene un procedimiento, dos funciones y dos triggers documentados. |

Para probar en Oracle, ejecuta el DDL, luego el DML, después el PL/SQL y finalmente el DQL. Los reportes de calificaciones y asistencia necesitan las funciones `fn_final_grade` y `fn_attendance_percentage`. En un esquema vacío, empieza el DDL desde el primer `CREATE TABLE`. El bloque inicial de `DROP TABLE` se usa para recrear el esquema y elimina los datos existentes.

Los triggers se crean después de la carga inicial. Para comprobar sus reglas, realiza pruebas de inserción y actualización una vez compilado el PL/SQL.

## Entregas del proyecto

### Entrega 0 - Caso de estudio

En esta etapa se realizó:

- Definición del problema.
- Construcción del enunciado del caso.
- Definición de los requerimientos mediante historias de usuario.
- Acuerdos y organización inicial del equipo.

### Entrega 1 - Modelo Entidad-Relación

En esta etapa se desarrolla:

- Ajuste del enunciado del caso.
- Ajuste de los requerimientos e historias de usuario.
- Construcción del modelo conceptual.
- Elaboración del Modelo Entidad-Relación (MER).
- Registro de bitácoras de seguimiento.
- Registro de actas de reuniones.
- Actualización de la documentación del repositorio.

### Entrega 2 - Modelo relacional

- Transformación del modelo conceptual al modelo relacional.
- Documentación de las dependencias funcionales.

### Entrega 3 - SQL y PL/SQL

- DDL de las 15 tablas y sus restricciones de integridad.
- Datos ficticios para los módulos de Matrículas, Materias y grupos, Calificaciones, Estado académico y Asistencia.
- Once reportes académicos, incluido un TOP 10 de promedios históricos.
- Procedimiento para registrar retiros, funciones para calcular notas y asistencia, y triggers para validar inscripciones y fechas de asistencia.

- Documentación de los [riesgos del uso de IAg](doc/Riesgos%20del%20uso%20de%20IAg.md) en un contexto profesional y registro de los prompts en la [bitácora](doc/Bitacora%20de%20prompts.md).

## Caso de estudio

El caso de estudio corresponde a una problemática real identificada en Fundaobrera y fue planteado como un caso original para el desarrollo del proyecto académico.

El sistema busca facilitar la trazabilidad del proceso formativo de los estudiantes y permitir consultar de manera centralizada su información personal, matrículas, materias cursadas, calificaciones, asistencia y estado académico.

## Reportes y consultas

El script [`03_dql.sql`](src/03_dql.sql) contiene los siguientes reportes.

1. Estudiantes matriculados por programa.
2. Cantidad de estudiantes por programa y periodo académico.
3. Materias cursadas por cada estudiante, con programa, periodo, grupo y docente.
4. Calificaciones definitivas obtenidas por cada estudiante en sus materias.
5. Promedio académico de cada estudiante por programa y periodo académico.
6. Materias aprobadas y no aprobadas por estudiante, identificando también las matrículas sin materias asignadas y las materias sin calificaciones registradas.
7. TOP 10 de promedios históricos por estudiante y programa, calculados con las notas definitivas disponibles de todos los periodos académicos.
8. Cantidad de estudiantes activos (cursando), retirados y graduados por programa.
9. Estudiantes retirados con sus fechas y motivos de retiro.
10. Estudiantes graduados con sus fechas y datos del acta de graduación.
11. Porcentaje de asistencia de cada estudiante por materia, grupo y periodo académico.

## Tecnologías y herramientas

- Oracle SQL Developer y Data Modeler.
- Git.
- GitHub.

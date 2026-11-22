# SID_202608_Fundaobrera

## Descripción del proyecto

Este repositorio contiene el desarrollo del proyecto de la asignatura Sistemas Intensivos en Datos.

El proyecto tiene como objetivo diseñar una base de datos para el Sistema de Gestión del Historial Académico de Estudiantes de Fundaobrera, institución ubicada en Cali que ofrece programas técnicos laborales.
s
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
| [`02_dml.sql`](src/02_dml.sql) | Carga los datos ficticios. |
| [`03_dql.sql`](src/03_dql.sql) | Contiene los reportes. |
| [`04_plsql.sql`](src/04_plsql.sql) | Contiene el procedimiento, la función y el trigger de la entrega. |

Para probar en Oracle, ejecuta el DDL, luego el DML, posteriormente el PLSQL y finalmente el DQL. El PLSQL va antes del DQL porque los reportes de calificaciones usan la función `fn_final_grade`. En un esquema vacío, empieza el DDL desde el primer `CREATE TABLE`. El bloque inicial de `DROP TABLE` se usa para recrear el esquema y elimina los datos existentes.

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

- DDL del esquema y scripts de carga y consulta de Matrículas.
- Integración pendiente de los demás módulos, las rutinas PL/SQL y la documentación sobre los riesgos del uso de IAg.

## Caso de estudio

El caso de estudio corresponde a una problemática real identificada en Fundaobrera y fue planteado como un caso original para el desarrollo del proyecto académico.

El sistema busca facilitar la trazabilidad del proceso formativo de los estudiantes y permitir consultar de manera centralizada su información personal, matrículas, materias cursadas, calificaciones, asistencia y estado académico.

## Reportes y consultas previstas

A partir de la información almacenada, el sistema permitirá obtener consultas como:

- Estudiantes matriculados por programa.
- Cantidad de estudiantes por programa y periodo académico.
- Porcentaje de asistencia de los estudiantes.
- Estudiantes activos, retirados y graduados.
- Materias cursadas por cada estudiante.
- Calificaciones obtenidas por estudiante.
- Estudiantes retirados y sus motivos.
- Estudiantes graduados y sus fechas de graduación.
- Promedio académico por programa y periodo.
- Materias aprobadas y no aprobadas.

## Tecnologías y herramientas

- Oracle SQL Developer y Data Modeler.
- Git.
- GitHub.

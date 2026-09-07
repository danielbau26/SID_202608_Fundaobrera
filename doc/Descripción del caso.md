# **Sistema de Gestión del Historial Académico de Estudiantes de Fundaobrera (caso original)**

## **PROBLEMA**
Fundaobrera es una institución que maneja varios programas técnico laborales situada en Cali, contando con una sola sede en el barrio san Vicente/ AV. Las Américas. La empresa cuenta con certificación de calidad, tiene más de 15 años de experiencia y les interesa la trazabilidad y control del proceso formativo de sus estudiantes.
Actualmente la gestión la realiza la secretaría académica, que maneja la relación, de estudiantes, asignaturas, y calificaciones para cada programa de manera manual, esto es difícil de organizar, ya que se cuenta con una gran cantidad de estudiantes en los diferentes programas, cursos y diplomados, de periodos anteriores, y actuales, al mismo tiempo, además de que es difícil conocer su estado actual, y su historial académico, esto hace que se pierda mucho tiempo en esta búsqueda manual a través de archivos, y puede existir riesgo de pérdidas de información o de error humano que también puede estar presente.
Por estos motivos, la empresa desea construir un sistema centralizado que permita optimizar esta búsqueda de información y permita desarrollar las actividades administrativas de una mejor manera.


## **ENUNCIADO**

La institución ofrece diferentes programas técnicos laborales, los cuales deben de ser registrados mediante un identificador único, un nombre, duración del programa y valor del semestre. Cada programa está conformado por una o varias materias y una materia puede pertenecer a uno o varios programas. Cada materia debe registrarse mediante un identificador único y un nombre. Para cada materia asociada a un programa se debe registrar el semestre en el que debe ser cursada.

La secretaria debe de poder registrar estudiantes indicando el nombre completo, tipo de documento, número de documento, fecha de nacimiento, teléfono, dirección, correo electrónico, estrato y experiencia laboral. El número de documento debe ser único para cada estudiante.

Cada periodo académico debe de contar con un identificador único, año, fecha de inicio y fecha de finalización. Un periodo académico puede estar asociado a múltiples matrículas y grupos, mientras que cada matrícula y cada grupo deben estar asociados a un único período académico.

La secretaria debe de poder registar profesores con su nombre completo, tipo de documento, número de documento, **dirección**, correo y teléfono. Los profesores podrán ser asignados a grupos de una materia en un determinado programa y periodo académico. Un profesor puede tener asignados varios grupos y una materia debe tener uno o más grupos.

Para cada materia que se dicte en un programa durante un periodo académico, la secretaría debe crear uno o varios grupos, indicando un **NRC** único, la materia, el programa, el semestre, el periodo académico y el profesor que la dictará. Una materia asociada a un programa puede tener uno o varios grupos en un mismo periodo académico y programa, los cuales pueden ser asignados a diferentes profesores.

Cuando un estudiante vaya a inscribirse en algún programa, la secretaría debe de crear una matrícula indicando el estudiante, el programa de formación, semestre y el periodo académico que cursara. Al finalizar cada semestre, si el estudiante desea continuar, la secretaría deberá de crear una nueva matrícula correspondiente al siguiente semestre. Cada matrícula representa un semestre cursado por el estudiante dentro de un programa y periodo académico determinado. Un estudiante no puede tener más de una matrícula para el mismo programa y periodo académico.

Las materias que el estudiante debe cursar se le asocian automáticamente a su matrícula según las materias asignadas a cada programa y el semestre registrado en la matrícula. Si una materia tiene más de un grupo disponible en el periodo, la secretaría debe indicar a cuál grupo queda asignado el estudiante. Un estudiante solo podrá estar asignado a un grupo por cada materia dentro de una matrícula.

Al momento de crear la matrícula, el sistema almacenará automáticamente el valor del semestre correspondiente asociado al programa. Este valor de la matrícula no debe de ser cambiado en caso de que el valor del programa cambie.

Los profesores podrán consultar únicamente los grupos, materias y estudiantes que tengan asignados. Para cada estudiante deberán registrar las notas correspondientes a las materias de los grupos que tiene asignados, utilizando una calificación entre 0.0 y 5.0. Solo el profesor asignado podrá registrar y actualizar las calificaciones de los estudiantes pertenecientes a dicho grupo.

Los profesores deberán registrar la asistencia de los estudiantes en cada clase indicando el grupo, la fecha y si el estudiante asistió o no.

Cada matrícula deberá tener un estado que indique la situación del estudiante en ese programa, el estudiante puede encontrarse cursando, retirado o graduado. Una matrícula en estado retirado debe tener la fecha del retiro y el motivo. Una matrícula en estado graduado debe tener obligatoriamente la fecha de graduación, número de acta y documento del acta de grado (pdf). Esta información solo debe de existir si el estudiante se graduó.

La secretaria debe de poder registrar pagos asociados a cada matrícula indicando identificador único, valor del monto cancelado, fecha del pago, método de pago (consignación, efectivo o débito) y descripción del pago. Cada pago debe estar asociado a una única matrícula y una matrícula puede tener múltiples pagos.

El sistema deberá calcular el total pagado y el saldo pendiente de cada matrícula a partir de los pagos registrados. De esta manera no se deberá modificar el valor de la matrícula manualmente cada vez que se registre un pago. El sistema no debe permitir registrar pagos que superen el saldo pendiente de la matrícula. El valor de cada matrícula corresponderá al valor del semestre establecido para el programa en el momento de crearla. Este valor deberá conservarse en la matrícula y no deberá modificarse si posteriormente cambia el valor del semestre del programa.

La secretaria debe poder consultar y actualizar la información de los estudiantes, programas, materias y matrículas. Los profesores también deben de poder consultar la información de los grupos, materias y estudiantes que están asignados a sus clases, además deben de poder consultar, registrar y actualizar las notas y asistencias de sus estudiantes.

Finalmente, la institución requiere obtener información consolidada a partir de los datos registrados, permitiendo consultar: Estudiantes matriculados por programa; porcentaje de asistencia de los estudiantes; estudiantes activos, retirados y graduados; materias cursadas por cada estudiante; calificaciones obtenidas por cada estudiante; cantidad de estudiantes por programa y periodo académico; estudiantes retirados y sus respectivos motivos; estudiantes graduados y sus fechas de graduación; promedio académico de los estudiantes por programa y periodo académico; materias aprobadas y no aprobadas, total recaudado por periodo académico; y estudiantes con saldo pendiente de pago.

## **Link de la página de fundaobrera: https://www.fundaobrera.edu.co/index.php**

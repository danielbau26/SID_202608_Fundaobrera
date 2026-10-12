# **Sistema de Gestión del Historial Académico de Estudiantes de Fundaobrera (caso original)**

## **HISTORIAS DE USUARIO**

### **Programas, materias y periodos**

#### **Título: Registrar un programa académico**

Yo, como secretario/a de Fundaobrera,

Quiero registrar un nuevo programa académico,

Para mantener actualizada la oferta académica de la institución.

**Criterios de aceptación:**

**Scenario: Registro exitoso de un programa académico**

Given el empleado se encuentra en la opción de registro de programas académicos

And ingresa todos los datos obligatorios del programa

When el empleado confirma el registro

Then el sistema debe crear el programa académico y mostrar un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por programa ya existente**

Given el empleado se encuentra en la opción de registro de programas académicos

And existe un programa registrado con el mismo nombre o código

When el empleado confirma el registro

Then el sistema debe rechazar el registro y mostrar un mensaje indicando que el programa ya se encuentra registrado

#### **Título: Consultar programas académicos**

Yo, como secretario/a de Fundaobrera,

Quiero consultar los programas académicos registrados,

Para conocer la oferta académica disponible en la institución.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de programas académicos**

Given existen programas académicos registrados en el sistema

When el empleado accede a la opción de consulta de programas

Then el sistema debe mostrar el listado de programas académicos registrados

**Scenario: Consulta sin programas registrados**

Given no existen programas académicos registrados en el sistema

When el empleado accede a la opción de consulta de programas

Then el sistema debe mostrar un mensaje indicando que no existen programas académicos registrados

#### **Título: Actualizar información de un programa académico**

Yo, como secretario/a de Fundaobrera,

Quiero actualizar la información de un programa académico,

Para mantener sus datos correctos y actualizados.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de un programa académico**

Given el programa académico se encuentra registrado en el sistema

And el empleado ha modificado uno o más datos permitidos

When el empleado confirma la actualización

Then el sistema debe guardar los cambios y mostrar un mensaje indicando que la actualización fue exitosa

**Scenario: Actualización fallida por programa inexistente**

Given el programa académico no se encuentra registrado en el sistema

When el empleado intenta actualizar su información

Then el sistema debe impedir la actualización y mostrar un mensaje indicando que el programa no existe

#### **Título: Registrar una materia**

Yo, como secretario/a de Fundaobrera,

Quiero registrar una nueva materia,

Para mantener actualizada la información académica de las asignaturas ofrecidas por la institución.

**Criterios de aceptación:**

**Scenario: Registro exitoso de una materia**

Given el empleado se encuentra en la opción de registro de materias

And ingresa todos los datos obligatorios de la materia

When el empleado confirma el registro

Then el sistema debe crear la materia y mostrar un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por materia ya existente**

Given existe una materia registrada con el mismo nombre o código

When el empleado intenta registrar nuevamente la materia

Then el sistema debe rechazar el registro y mostrar un mensaje indicando que la materia ya se encuentra registrada

#### **Título: Consultar materias**

Yo, como secretario/a de Fundaobrera,

Quiero consultar las materias registradas,

Para conocer las asignaturas disponibles en la institución.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de materias**

Given existen materias registradas en el sistema

When el empleado accede a la opción de consulta de materias

Then el sistema debe mostrar el listado de las materias registradas

**Scenario: Consulta sin materias registradas**

Given no existen materias registradas en el sistema

When el empleado accede a la opción de consulta de materias

Then el sistema debe mostrar un mensaje indicando que no existen materias registradas

#### **Título: Actualizar información de una materia**

Yo, como secretario/a de Fundaobrera,

Quiero actualizar la información de una materia,

Para mantener sus datos académicos correctos y actualizados.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de una materia**

Given la materia se encuentra registrada en el sistema

And el empleado modifica uno o más datos permitidos

When el empleado confirma la actualización

Then el sistema debe guardar los cambios y mostrar un mensaje indicando que la actualización fue exitosa

**Scenario: Actualización fallida por materia inexistente**

Given la materia no se encuentra registrada en el sistema

When el empleado intenta actualizar su información

Then el sistema debe impedir la actualización y mostrar un mensaje indicando que la materia no existe

#### **Título: Asociar una materia a un programa académico**

Yo, como secretario/a de Fundaobrera,

Quiero asociar una materia a un programa académico,

Para definir las asignaturas que pertenecen al plan académico de cada programa.

**Criterios de aceptación:**

**Scenario: Asociación exitosa de una materia a un programa**

Given el programa académico y la materia se encuentran registrados en el sistema

When el empleado selecciona la materia y confirma su asociación al programa

Then el sistema debe guardar la relación y mostrar un mensaje indicando que la materia fue asociada correctamente

**Scenario: Asociación fallida por materia ya asociada**

Given la materia ya se encuentra asociada al programa académico seleccionado

When el empleado intenta asociarla nuevamente

Then el sistema debe rechazar la asociación y mostrar un mensaje indicando que la materia ya pertenece al programa

#### **Título: Definir semestre de una materia dentro de un programa**

Yo, como secretario/a de Fundaobrera,

Quiero asignar una materia a un semestre específico dentro de un programa académico,

Para organizar el orden en el que deben cursarse las materias del programa.

**Criterios de aceptación:**

**Scenario: Asignación exitosa de una materia a un semestre**

Given la materia se encuentra asociada al programa académico

And el semestre seleccionado es válido

When el empleado confirma la asignación

Then el sistema debe guardar el semestre correspondiente a la materia y mostrar un mensaje de éxito

**Scenario: Asignación fallida por semestre no válido**

Given la materia se encuentra asociada al programa académico

And el empleado selecciona un semestre que no corresponde a la estructura del programa

When intenta confirmar la asignación

Then el sistema debe rechazar la operación y mostrar un mensaje indicando que el semestre seleccionado no es válido

#### **Título: Registrar un periodo académico**

Yo, como secretario/a de Fundaobrera,

Quiero registrar un nuevo periodo académico,

Para organizar las actividades académicas correspondientes a cada periodo de la institución.

**Criterios de aceptación:**

**Scenario: Registro exitoso de un periodo académico**

Given el empleado se encuentra en la opción de registro de periodos académicos

And ingresa los datos obligatorios del periodo

When el empleado confirma el registro

Then el sistema debe crear el periodo académico y mostrar un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por periodo académico ya existente**

Given existe un periodo académico registrado con la misma identificación

When el empleado intenta registrar nuevamente el periodo

Then el sistema debe rechazar el registro y mostrar un mensaje indicando que el periodo académico ya existe

#### **Título: Consultar periodos académicos**

Yo, como secretario/a de Fundaobrera,

Quiero consultar los periodos académicos registrados,

Para conocer los periodos disponibles y su información correspondiente.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de periodos académicos**

Given existen periodos académicos registrados en el sistema

When el empleado accede a la opción de consulta de periodos académicos

Then el sistema debe mostrar el listado de los periodos registrados

**Scenario: Consulta sin periodos académicos registrados**

Given no existen periodos académicos registrados en el sistema

When el empleado accede a la opción de consulta de periodos académicos

Then el sistema debe mostrar un mensaje indicando que no existen periodos registrados

#### **Título: Actualizar información de un periodo académico**

Yo, como secretario/a de Fundaobrera,

Quiero actualizar la información de un periodo académico,

Para mantener correctos y actualizados los datos relacionados con su duración y estado.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de un periodo académico**

Given el periodo académico se encuentra registrado en el sistema

And el empleado modifica uno o más datos permitidos

When el empleado confirma la actualización

Then el sistema debe guardar los cambios y mostrar un mensaje indicando que la actualización fue exitosa

**Scenario: Actualización fallida por periodo académico inexistente**

Given el periodo académico no se encuentra registrado en el sistema

When el empleado intenta actualizar su información

Then el sistema debe impedir la actualización y mostrar un mensaje indicando que el periodo académico no existe

#### **Título: Consultar materias**

Yo, como secretario/a de Fundaobrera,

Quiero consultar las materias registradas,

Para conocer las asignaturas disponibles en la institución.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de materias**

Given existen materias registradas en el sistema

When el empleado accede a la opción de consulta de materias

Then el sistema debe mostrar el listado de las materias registradas

**Scenario: Consulta sin materias registradas**

Given no existen materias registradas en el sistema

When el empleado accede a la opción de consulta de materias

Then el sistema debe mostrar un mensaje indicando que no existen materias registradas

### **Estudiantes y matrículas**

#### **Título: Registrar estudiante**

Yo, como secretario/a de Fundaobrera,

Quiero registrar la información personal, de contacto y laboral de un estudiante,

Para mantener centralizada y actualizada la información de los estudiantes de la institución.

**Criterios de aceptación:**

**Scenario: Registro exitoso de un estudiante**

Given el empleado se encuentra en la opción de registrar estudiante

When ingresa nombre completo, tipo y número de documento, fecha de nacimiento, teléfono, dirección, correo electrónico, estrato e indica si el estudiante trabaja

And registra la empresa y el cargo actuales cuando el estudiante trabaja

Then el sistema crea al estudiante y muestra un mensaje indicando que el registro fue exitoso.

**Scenario: Registro fallido por número de documento duplicado**

Given existe un estudiante registrado con el número de documento ingresado

When el empleado intenta confirmar el registro de otro estudiante con ese número

Then el sistema rechaza el registro e indica que el número de documento ya está registrado.

#### **Título: Consultar estudiante**

Yo como secretario/a de Fundaobrera,

Quiero consultar el listado de estudiantes registrados,

Para reconocer más fácil y rápido quién hacen parte de la institución.

**Criterios de aceptación:**

**Scenario: Consulta a estudiantes de forma exitosa**

 Given existen estudiantes registrados en el sistema

When el empleado accede a la opción de consulta de estudiante

Then el sistema debe mostrar los estudiantes registrados

**Scenario: Consulta sin estudiantes registrados**

 Given no existen estudiantes registrados en el sistema

When el empleado accede a la opción de consultar estudiantes

Then el sistema arroja un mensaje de que no hay estudiantes registrados

#### **Título: Actualizar información de estudiante**

Yo como secretario/a de Fundaobrera,

Quiero actualizar los datos de un estudiante,

Para mantener su información al día.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de datos**

  Given el estudiante se encuentra registrado en el sistema y el empleado modifica 1 o mas datos permitidos

When el empleado confirma la actualización

Then el sistema guarda los cambios y arroja mensaje para confirmar la correcta actualización

**Scenario: actualización fallida por número de identificación que ya está en uso**

  Given el estudiante ya está registrado en el sistema y el empleado intenta cambiar número de identificación por uno que ya está registrado en el sistema

When el empleado confirma la actualización

Then el sistema no permite guardar los cambios y arroja mensaje de identificación duplicada

#### **Título: Consultar información detallada del estudiante**

Yo como secretario/a de Fundaobrera,

Quiero conocer la información y el historial académico de un estudiante en específico,

Para conocer el estado actual y su trayectoria dentro de la institución sin tener que buscar en archivos manualmente

**Criterios de aceptación:**

**Scenario: Consulta exitosa de un estudiante**

  Given el estudiante se encuentra registrado en el sistema

When el empleado busca al estudiante por su número de documento

Then el sistema muestra los datos personales, sus matrículas, materias, calificaciones y estado académico

**Scenario: Consulta fallida por estudiante inexistente**

  Given no existe un estudiante registrado con el documento ingresado

When el empleado busca al estudiante por ese número de documento

Then el sistema arroja un mensaje indicando que no se encontró ningún estudiante con ese documento

#### **Título: Registrar matricula de estudiante**

Yo, como secretario/a de Fundaobrera,

Quiero registrar la matrícula de un estudiante en un programa, semestre y periodo académico,

Para oficializar su inscripción y asignarle automáticamente las materias que debe cursar.

**Criterios de aceptación:**

**Scenario: Registro exitoso de matrícula**

Given el estudiante, el programa y el periodo académico se encuentran registrados y el estudiante no tiene otra matrícula para ese mismo programa y periodo

When el empleado registra la matrícula indicando el estudiante, programa, semestre y periodo académico

Then el sistema crea la matrícula, asocia automáticamente las materias del programa y semestre correspondiente y muestra un mensaje indicando que el registro fue exitoso.

**Scenario: Registro fallido por matrícula duplicada**

Given el estudiante ya tiene una matrícula para el mismo programa y periodo académico

When el empleado intenta registrar otra matrícula para ese estudiante, programa y periodo

Then el sistema rechaza el registro e indica que el estudiante ya cuenta con una matrícula para ese programa y periodo.


#### **Título: Consultar matrículas**

Yo como secretario/a de Fundaobrera,

Quiero consultar las matrículas registradas,

Para conocer en qué programa, semestre y periodo se encuentra inscrito cada estudiante.

**Criterios de aceptación:**

**Scenario: Consulta de matrícula exitosa**

  Given existen matrículas registradas en el sistema

When el empleado accede a la opción de consulta de matrículas

Then el sistema debe mostrar el listado de matrículas con su estudiante, programa, semestre, periodo y estado

**Scenario: Consulta sin mattriculas registradas**

  Given no existen matrículas registradas en el sistema

When el empleado accede a la opción de consulta de matrículas

Then el sistema debe mostrar un mensaje indicando que no existen matrículas registradas

#### **Título: Actualizar información de una matrícula**

Yo, como secretario/a de Fundaobrera,

Quiero actualizar los datos permitidos de una matrícula, como el grupo asignado a una materia,

Para corregir o ajustar la inscripción del estudiante cuando sea necesario.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de matrícula**

Given la matrícula está registrada y el nuevo grupo corresponde a la misma materia, programa y periodo académico de la inscripción

When el empleado confirma el cambio del grupo asignado

Then el sistema actualiza la inscripción del estudiante y muestra un mensaje indicando que la actualización fue exitosa.

**Scenario: Actualización fallida por grupo incompatible**

Given la matrícula está registrada y el grupo seleccionado no corresponde a la materia, programa o periodo académico de la inscripción

When el empleado intenta confirmar el cambio de grupo

Then el sistema rechaza la actualización e indica que el grupo no corresponde a la inscripción.

#### **Título: Cambiar estado de matricula**

Yo como secretario/a de Fundaobrera,

Quiero cambiar el estado de una matrícula entre cursando, retirado o graduado,

Para reflejar la situación actual del estudiante en el programa

**Criterios de aceptación:**

**Scenario: Cambio de estado exitoso**

  Given la matrícula se encuentra en estado "cursando" y el empleado selecciona el nuevo estado y diligencia la información obligatoria que ese estado requiera

When el empleado confirma el cambio

Then el sistema debe actualizar el estado de la matrícula y mostrar un mensaje indicando que el cambio fue exitoso

**Scenario: Cambio de estado fallido por información incompleta**

  Given el empleado intenta cambiar el estado de la matrícula a "retirado" o "graduado" y no diligencia los datos obligatorios que ese estado requiere (fecha y motivo, o fecha, acta y documento de grado)

When el empleado confirma el cambio

Then el sistema debe rechazar el cambio y mostrar un mensaje indicando cuáles datos faltan

#### **Título: Registrar retiro de un estudiante**

Yo como secretario/a de Fundaobrera,

Quiero registrar el retiro de un estudiante de una matrícula indicando la fecha y el motivo,

Para dejar constancia de por qué y cuándo dejó de cursar el programa

**Criterios de aceptación:**

**Scenario: Registro exitoso registrado**

  Given la matrícula del estudiante se encuentra en estado "cursando" y el empleado ingresa la fecha de retiro y el motivo

When el empleado confirma el retiro

Then el sistema debe cambiar el estado de la matrícula a "retirado", guardar la fecha y el motivo, y mostrar un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por falta del motivo de retiro**

  Given la matrícula del estudiante se encuentra en estado "cursando" y el empleado no ingresa el motivo del retiro

When el empleado intenta confirmar el retiro

Then el sistema debe rechazar el registro y mostrar un mensaje indicando que el motivo del retiro es obligatorio

#### **Título: Registrar graduación de un estudiante**

Yo como secretario/a de Fundaobrera,

Quiero registrar la graduación de un estudiante usando la fecha de graduación, el número de acta y el documento del acta de grado,

Para tener constancia formal de que culminó satisfactoriamente el programa

**Criterios de aceptación:**

**Scenario: Registro exitoso de la graduación**

  Given la matricula del estudiante esta en estado “cursando” y el empleado ingresa la fecha de graduación, el número de acta y adjunta el documento del acta en PDF

When el empleado confirma la graduación

Then el sistema debe cambiar el estado de la matrícula a "graduado" luego guardar la fecha, el número de acta y el documento, y arrojar un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por documento de acta faltante o en formato inválido**

  Given el empleado está registrando la graduación de un estudiante y no adjunta el documento del acta o lo adjunta en un formato distinto a PDF

When el empeado trata de confirmar la graduación

Then el sistema debe rechazar el registro y arrojar un mensaje indicando que el documento del acta en PDF es obligatorio

#### **Título: Consultar estudiante por estado**

Yo como secretario/a de Fundaobrera,

Quiero consultar los estudiantes filtrados por estado es decir: cursando, retirado o graduado,

Para tener la información acerca del estado académico de los estudiantes por programa y periodo

**Criterios de aceptación:**

**Scenario: Consulta exitosa de estudiantes por estado**

  Given existen matriculas registradas con distintos estados

When el empleado selecciona algún estado valido y usa el filtro

Then el sistema debe mostrar a los estudiantes con ese estado

**Scenario: Consulta sin resultados para el estado seleccionado**

  Given no existen matriculas registradas con dicho estado

When el empleado busca bajo algún filtro valido

Then el sistema arroja mensaje de que no hay estudiantes con ese filtro

### **Profesores, grupos y asignaciones**

#### **Título: Registrar profesor**

Yo, como secretario/a de Fundaobrera,

Quiero registrar un profesor con sus datos personales y de contacto,

Para disponer de su información al asignarlo a los grupos.

**Criterios de aceptación:**

**Scenario: Registro exitoso de un profesor**

Given la secretaria se encuentra en la opción de registrar profesor

When ingresa nombre completo, tipo de documento, número de documento, dirección, correo electrónico y teléfono

Then el sistema crea al profesor y muestra un mensaje indicando que el registro fue exitoso

**Scenario: Registro fallido por datos incompletos**

Given la secretaria se encuentra en la opción de registrar profesor

When intenta confirmar el registro sin completar uno o más datos obligatorios

Then el sistema rechaza el registro e indica cuáles campos obligatorios debe completar

#### **Título: Consultar profesores**

Yo, como secretario/a de Fundaobrera,

Quiero consultar los profesores registrados,

Para conocer y gestionar la información de los profesores disponibles.

**Criterios de aceptación:**

**Scenario: consulta exitosa de profesores**

Given existen profesores registrados en el sistema

When la secretaria solicita consultar la información de los profesores

Then el sistema debe mostrar la información de los profesores registrados

**Scenario: no existen profesores registrados**

Given que no existen profesores registrados en el sistema

When la secretaria solicita consultar la información de los profesores

Then el sistema debe informar que no existen ningún profesor registrado

#### **Título: Actualizar información de un profesor**

Yo, como secretario/a de Fundaobrera

Quiero actualizar la información de un profesor

Para mantener sus datos actualizados en el sistema.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de la información de un profesor**

Given que existe un profesor registrado

When la secretaria modifica sus datos con información válida

Then el sistema debe actualizar la información del profesor correctamente

**Scenario: Actualización con información inválida**

Given que existe un profesor registrado

When la secretaria modifica sus datos y deja un campo obligatorio vacío

Then el sistema debe indicar con (*) los datos que deben corregirse.

#### **Título: Crear grupo de una materia**

Yo, como secretario/a de Fundaobrera,

Quiero crear grupos para las materias de un programa,

Para organizar las clases que serán dictadas durante cada periodo académico.

**Criterios de aceptación:**

**Scenario: Creación exitosa de un grupo**

Given la materia está asociada al programa y existen un periodo académico y un profesor registrados

When la secretaria crea el grupo indicando NRC, materia, programa, semestre, periodo académico y profesor

Then el sistema crea el grupo con un NRC único para todo el sistema, que no podrá reutilizarse en periodos posteriores.

**Scenario: Creación fallida por NRC ya utilizado**

Given el NRC ingresado ya pertenece a un grupo del periodo actual o de un periodo anterior

When la secretaria intenta crear el grupo con ese NRC

Then el sistema rechaza la creación e indica que el NRC ya fue utilizado.

#### **Título: Consultar grupos**

Yo, como secretario/a de Fundaobrera

Quiero consultar los grupos registrados

Para conocer las materias, programas, periodos y profesores asociados a cada grupo.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de grupos**

Given que existen grupos registrados en el sistema

When la secretaria solicita consultar los grupos

Then el sistema debe mostrar los grupos registrados con su información correspondiente.

**Scenario: No existen grupos registrados**

Given que no existen grupos registrados en el sistema

When la secretaria solicita consultar los grupos

Then el sistema debe informar que no existen grupos registrados.

#### **Título: Asignar profesor a un grupo**

Yo, como secretario/a de Fundaobrera

Quiero asignar un profesor a un grupo

Para establecer quién será responsable de dictar la materia.

**Criterios de aceptación:**

**Scenario: Asignación exitosa de un profesor**

Given que existe un profesor y un grupo registrados

When la secretaria asigna el profesor al grupo

Then el sistema debe registrar correctamente la asignación del profesor al grupo.

**Scenario: Asignación de un profesor inexistente**

Given que el grupo existe pero el profesor que se intenta asignar no está registrado

When la secretaría intenta realizar la asignación

Then el sistema debe rechazar la asignación e indicar que el profesor no existe.

#### **Título: Consultar grupos asignados al profesor**

Yo, como profesor/a de Fundaobrera

Quiero consultar los grupos que tengo asignados

Para conocer las materias y estudiantes que están bajo mi responsabilidad.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de grupos asignados**

Given que el profesor tiene uno o más grupos asignados

When consulta sus grupos

Then el sistema debe mostrar únicamente los grupos que tiene asignados.

**Scenario: Profesor sin grupos asignados**

Given que el profesor no tiene grupos asignados

When consulta sus grupos

Then el sistema debe informar que no tiene grupos asignados.

#### **Título: Asignar estudiante a un grupo**

Yo, como secretario/a de Fundaobrera,

Quiero asignar un estudiante a un grupo de una materia de su matrícula,

Para establecer el grupo que cursará durante el periodo académico.

**Criterios de aceptación:**

**Scenario: Asignación exitosa del estudiante**

Given el estudiante tiene una matrícula, la materia está asociada a ella y el grupo corresponde a esa materia, programa y periodo académico

And el estudiante no tiene otro grupo asignado para esa materia dentro de la matrícula

When la secretaria confirma la asignación al grupo

Then el sistema crea la inscripción del estudiante al grupo, vinculada a su matrícula, para asociar sus notas y asistencia.

**Scenario: Asignación fallida por grupo incompatible**

Given el estudiante tiene una matrícula y el grupo seleccionado pertenece a otra materia, programa o periodo académico

When la secretaria intenta asignar al estudiante a ese grupo

Then el sistema rechaza la asignación e indica que el grupo no corresponde a la materia, programa o periodo académico de la matrícula.
rechazar la asignación e indicar que el estudiante ya tiene un grupo asignado para esa materia.

#### **Título: Consultar estudiantes de un grupo**

Yo, como profesor/a de Fundaobrera

Quiero consultar los estudiantes asignados a mis grupos

Para conocer los estudiantes a los que debo realizar seguimiento académico.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de estudiantes**

Given que el profesor tiene un grupo asignado y existen estudiantes asociados a dicho grupo

When el profesor consulte los estudiantes del grupo

Then el sistema debe mostrar los estudiantes pertenecientes al grupo.

**Scenario: El profesor intenta consultar un grupo no asignado**

Given que el profesor no tiene asignado el grupo que intenta consultar

When solicita consultar los estudiantes de dicho grupo

Then el sistema debe rechazar la consulta y no mostrar información de los estudiantes del grupo.

### **Calificaciones y asistencia**

#### **Título: Registro de calificaciones de estudiantes**

Yo, como profesor,

Quiero registrar las notas de las actividades evaluativas de los estudiantes inscritos en mis grupos asignados,

Para mantener actualizado su desempeño académico y permitir el cálculo de la calificación definitiva de cada materia.

**Criterios de aceptación:**

**Scenario: Registro exitoso de una calificación**

Given el profesor tiene asignado el grupo, el estudiante está inscrito en él y la actividad evaluativa pertenece a ese grupo

When registra una calificación entre 0.0 y 5.0 para el estudiante en la actividad evaluativa

Then el sistema guarda la nota asociada a la actividad evaluativa y a la inscripción del estudiante en el grupo.

**Scenario: Calificación fuera del rango permitido**

Given el profesor tiene asignado el grupo y está registrando la nota de una actividad evaluativa de un estudiante inscrito

When ingresa una calificación menor a 0.0 o mayor a 5.0

Then el sistema rechaza el registro e indica que la calificación debe estar entre 0.0 y 5.0.


#### **Título: Actualización de calificaciones de estudiantes**

Yo, como profesor,

Quiero actualizar las notas de las actividades evaluativas de los estudiantes inscritos en mis grupos asignados,

Para corregir errores y mantener actualizada la información de su desempeño académico.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de una calificación**

Given el profesor tiene asignado el grupo y el estudiante tiene una nota registrada en una actividad evaluativa de ese grupo

When el profesor ingresa una nueva calificación válida entre 0.0 y 5.0

Then el sistema actualiza la nota asociada a la actividad evaluativa y a la inscripción del estudiante.

**Scenario: Profesor intenta actualizar una calificación de un grupo no asignado**

Given la calificación pertenece a una actividad evaluativa de un grupo que el profesor no tiene asignado

When intenta actualizar la calificación

Then el sistema rechaza la operación y conserva la nota sin cambios.

#### **Título: Registro de asistencia de estudiantes**

Yo, como profesor

Quiero registrar la asistencia de los estudiantes que tengo asignados en cada clase

Para mantener un control de la asistencia y consultar posteriormente el historial de asistencia de los estudiantes.

**Criterios de aceptación:**

**Scenario: Registro exitoso de asistencia**

 Given el profesor tiene asignado un grupo y puede consultar los estudiantes pertenecientes a este

When registra la asistencia de un estudiante indicando la fecha y si asistió o no

Then el sistema guarda el registro de asistencia asociado al estudiante, grupo y fecha.

**Scenario: Estudiante asistió a la clase**

 Given el profesor está registrando la asistencia de un estudiante asignado

When indica que el estudiante asistió

Then el sistema registra la asistencia como presente.

**Scenario: Estudiante no asistió a la clase**

 Given el profesor está registrando la asistencia de un estudiante asignado

When indica que el estudiante no asistió

Then el sistema registra la asistencia como ausente.

#### **Título: Consulta de asistencia de estudiantes**

Yo, como profesor

Quiero consultar los registros de asistencia de los estudiantes que tengo asignados

Para realizar seguimiento a su asistencia durante el periodo académico.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de asistencia**

 Given el profesor tiene asignado un grupo con estudiantes

When consulta los registros de asistencia

Then el sistema muestra la asistencia de los estudiantes correspondientes a sus grupos asignados.

**Scenario: Consulta de asistencia de un estudiante específico**

 Given el profesor tiene asignado al estudiante

When consulta su historial de asistencia

Then el sistema muestra los registros de asistencia del estudiante indicando la fecha y si asistió o no.

**Scenario: Consulta por fecha**

 Given el profesor tiene asignado un grupo con estudiantes

When consulta la asistencia de una fecha determinada

Then el sistema muestra los registros de asistencia correspondientes a esa fecha.

**Scenario: Profesor intenta consultar calificaciones no asignadas**

Given el profesor no tiene asignado al estudiante o la materia

When intenta consultar sus calificaciones

Then el sistema no permite acceder a dicha información.

#### **Título: Consulta del porcentaje de asistencia de estudiantes**

Yo, como profesor

Quiero consultar el porcentaje de asistencia de los estudiantes que tengo asignados

Para realizar seguimiento a su asistencia durante el periodo académico.

**Criterios de aceptación:**

**Scenario: Consulta exitosa del porcentaje de asistencia**

 Given el profesor tiene asignado un grupo con estudiantes y existen registros de asistencia

When consulta el porcentaje de asistencia

Then el sistema muestra el porcentaje de asistencia de los estudiantes correspondientes al grupo.

**Scenario: Consulta del porcentaje de asistencia de un estudiante específico**

 Given el profesor tiene asignado al estudiante y existen registros de asistencia

When consulta su porcentaje de asistencia

Then el sistema calcula y muestra el porcentaje de asistencia del estudiante.

**Scenario: Profesor intenta consultar estudiantes no asignados**

Given el estudiante no pertenece a ninguno de los grupos asignados al profesor

When el profesor intenta consultar su porcentaje de asistencia

Then el sistema no permite acceder a la información de asistencia del estudiante.

#### **Título: Consulta de calificaciones de estudiantes**

Yo, como profesor

Quiero consultar las calificaciones de los estudiantes que tengo asignados

Para hacer seguimiento a su desempeño académico.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de calificaciones**

 Given el profesor tiene asignado un grupo con estudiantes de una materia

When consulta las calificaciones

Then el sistema muestra las calificaciones registradas de los estudiantes correspondientes a sus grupos asignados.

**Scenario: No existen calificaciones registradas**

 Given el profesor tiene asignado un grupo o materia

When consulta las calificaciones y no existen registros

Then el sistema informa que no hay calificaciones registradas para la consulta realizada.

#### **Título: Consulta de materias cursadas por estudiante**

Yo, como secretaria académica

Quiero consultar las materias que ha cursado un estudiante

Para conocer y verificar su historial académico.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de materias cursadas**

 Given la secretaría se encuentra consultando la información de un estudiante registrado

When consulta las materias cursadas por el estudiante

Then el sistema muestra las materias que el estudiante ha cursado durante su historial académico.

**Scenario: Consulta del detalle de las materias cursadas**

 Given el estudiante tiene materias registradas en su historial académico

When la secretaria consulta sus materias cursadas

Then el sistema muestra cada materia junto con el programa, semestre, periodo académico y calificación obtenida, cuando exista.

#### **Título: Consulta del promedio académico por programa y periodo académico**

Yo, como secretaria académica

Quiero consultar el promedio académico de los estudiantes de un programa en un periodo académico determinado

Para analizar y realizar seguimiento al rendimiento académico de los estudiantes.

**Criterios de aceptación:**

**Scenario: Consulta exitosa del promedio académico**

 Given existen estudiantes con calificaciones registradas en un programa y periodo académico

When la secretaria consulta el promedio académico del programa y periodo seleccionado

Then el sistema calcula y muestra el promedio académico correspondiente.

**Scenario: No existen calificaciones registradas                                                                      Given el programa y periodo académico seleccionados no tienen calificaciones registradas**

When la secretaria consulta el promedio académico

Then el sistema informa que no existen calificaciones suficientes para calcular el promedio.

#### **Título: Consulta de materias aprobadas y no aprobadas**

Yo, como secretaria académica

Quiero consultar las materias aprobadas y no aprobadas de los estudiantes

Para conocer su progreso académico e identificar las materias que tienen pendientes por aprobar.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de materias aprobadas y no aprobadas**

 Given existen estudiantes con materias y calificaciones registradas

When la secretaria consulta las materias aprobadas y no aprobadas de un estudiante

Then el sistema muestra las materias clasificadas según su estado de aprobación.

**Scenario: Materia aprobada**

 Given un estudiante tiene una calificación registrada en una materia

When la calificación cumple con la nota mínima de aprobación establecida por la institución

Then el sistema clasifica la materia como aprobada.

**Scenario: Estudiante sin calificaciones registradas**

Given un estudiante tiene materias asignadas pero no tiene calificaciones registradas

When la secretaria consulta sus materias aprobadas y no aprobadas

Then the system reports that there are not enough grades to determine the approval status.

#### **Título: Registrar actividades evaluativas de un grupo**

Yo, como profesor/a de Fundaobrera,

Quiero registrar las actividades evaluativas de los grupos que tengo asignados,

Para definir las evaluaciones y sus porcentajes para calcular la calificación definitiva de cada materia.

**Criterios de aceptación:**

**Scenario: Registro exitoso de una actividad evaluativa**

Given el profesor tiene asignado un grupo

When registra una actividad evaluativa indicando un identificador único, nombre, porcentaje y fecha

Then el sistema guarda la actividad evaluativa asociada al grupo.

**Scenario: Registro fallido por identificador duplicado**

Given existe una actividad evaluativa registrada con el mismo identificador

When el profesor intenta registrar una nueva actividad con ese identificador

Then el sistema rechaza el registro e indica que el identificador ya está registrado.


#### **Título: Consultar actividades evaluativas de un grupo**

Yo, como profesor/a de Fundaobrera,

Quiero consultar las actividades evaluativas de los grupos que tengo asignados,

Para conocer las evaluaciones registradas y sus porcentajes correspondientes.

**Criterios de aceptación:**

**Scenario: Consulta exitosa de actividades evaluativas**

Given el profesor tiene asignado un grupo con actividades evaluativas registradas

When consulta las actividades evaluativas del grupo

Then el sistema muestra el identificador, nombre, porcentaje y fecha de cada actividad.

**Scenario: Profesor intenta consultar un grupo no asignado**

Given el profesor no tiene asignado el grupo seleccionado

When intenta consultar sus actividades evaluativas

Then el sistema rechaza la consulta y no muestra la información.


#### **Título: Calcular calificación definitiva de una materia**

Yo, como profesor/a de Fundaobrera,

Quiero que el sistema calcule automáticamente la calificación definitiva de cada estudiante en una materia,

Para obtener el resultado académico a partir de las notas de las actividades evaluativas y sus porcentajes.

**Criterios de aceptación:**

**Scenario: Cálculo exitoso de la calificación definitiva**

Given el estudiante está inscrito en un grupo y tiene registradas las notas de todas sus actividades evaluativas

And los porcentajes de las actividades suman el 100 %

When el sistema calcula la calificación definitiva

Then el sistema multiplica cada nota por su porcentaje correspondiente y suma los resultados para obtener la calificación definitiva de la materia.

**Scenario: Información incompleta para calcular la calificación definitiva**

Given faltan notas de actividades evaluativas o sus porcentajes no suman el 100 %

When se solicita calcular la calificación definitiva

Then el sistema informa que no se puede obtener la calificación definitiva e indica la información que debe completarse o corregirse.


#### **Título: Actualizar asistencia de estudiantes**

Yo, como profesor/a de Fundaobrera,

Quiero actualizar los registros de asistencia de los estudiantes de mis grupos asignados,

Para corregir errores y mantener actualizado su historial de asistencia.

**Criterios de aceptación:**

**Scenario: Actualización exitosa de asistencia**

Given el profesor tiene asignado un grupo y existe un registro de asistencia de un estudiante inscrito para una fecha determinada

When modifica el registro indicando si el estudiante asistió o no

Then el sistema guarda el cambio en el registro de asistencia correspondiente.

**Scenario: Profesor intenta actualizar asistencia de un grupo no asignado**

Given el profesor no tiene asignado el grupo al que pertenece el registro de asistencia

When intenta actualizar el registro

Then el sistema rechaza la operación y conserva el registro sin cambios.

### **Consultas consolidadas**

#### **Título: Consultar cantidad de estudiantes por programa y periodo**

Yo, como secretaria de Fundaobrera

Quiero consultar la cantidad de estudiantes matriculados por programa y periodo académico

Para conocer el numero de estudiantes por cada programa y periodo especifico

**Criterios de aceptación:**

**Scenario: Consulta con resultados**

 Given existen estudiantes matriculados en el programa y periodo consultados

When la secretaria consulta la cantidad de estudiantes filtrando por programa y periodo

Then el sistema muestra el numero de estudiantes que pertenecen al programa y periodo asociado

**Scenario: Consulta sin resultados**

 Given no existen estudiantes matriculados en el programa y periodo consultados

When la secretaria consulta la cantidad de estudiantes filtrando por programa y periodo

Then el sistema muestra que no hay estudiantes asociados al programa y periodo consultados

#### **Título: Consultar estudiantes retirados y motivos**

Yo, como secretaria de Fundaobrera

Quiero consultar los estudiantes retirados y el motivo de su retiro

Para llevar el control de que estudiantes no continuaron y porque razon

**Criterios de aceptación:**

**Scenario: Existen estudiantes retirados**

Given existen matrículas en estado retirado

When la secretaria consulta los estudiantes retirados

Then el sistema muestra los estudiantes retirados junto a su motivo

**Scenario: No existen estudiantes retirados**

Given no existen matrículas en estado retirado

When la secretaria consulta los estudiantes retirados

Then el sistema muestra un mensaje indicando que no hay estudiantes retirados.

#### **Título: Consultar estudiantes graduados y fechas de graduación**

Yo, como secretaria de Fundaobrera

Quiero consultar los estudiantes graduados y su fecha de graduación

Para tener conocimiento de que estudiantes terminaron el programa y cuando lo hicieron.

**Criterios de aceptación:**

**Scenario: Existen estudiantes graduados**

 Given existen matrículas en estado graduado

When la secretaria consulta los estudiantes graduados

Then el sistema muestra los estudiantes graduados y en que fecha se graduaron

**Scenario: No existen estudiantes graduados**

 Given no existen matrículas en estado graduado

When la secretaria consulta los estudiantes graduados

Then el sistema muestra un mensaje que indique que no hay estudiantes graduados
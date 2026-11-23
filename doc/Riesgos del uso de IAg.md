# Riesgos del uso de herramientas de IA generativa (IAg) en un contexto profesional

Este documento resume los riesgos de usar herramientas de IA generativa, como ChatGPT o Claude, para diseñar bases de datos y escribir SQL y PL/SQL en un entorno profesional. Cada riesgo se ilustra con lo que ocurrió en este proyecto, registrado en la [Bitácora de prompts](Bitacora%20de%20prompts.md), e incluye las medidas que tomamos o que se deberían tomar.

## 1. Respuestas incorrectas presentadas con seguridad ("alucinaciones")

La IAg produce texto plausible, no necesariamente verdadero. Puede inventar columnas, reglas o comportamientos y presentarlos con total seguridad.

**En este proyecto:**
- En el Prompt 7, la IA escribió criterios de aceptación diciendo que el sistema "calcula la tarifa correspondiente" y "recalcula la nota definitiva en `ENROLLMENT_GROUP`". Nuestro modelo no maneja tarifas, y la nota definitiva no se guarda en ninguna columna: se calcula con la función `fn_final_grade`.
- En el Prompt 6, la IA describió `ENROLLMENT_GROUP` con una clave sintética `id_enrollment_group` y un atributo `grade`. En el DDL final, `enrollments_groups` tiene una llave primaria compuesta (`group_nrc`, `enrollment_enrollment_id`) y no tiene columna de nota.

**Cómo mitigarlo:** contrastar cada respuesta con el enunciado del caso, el modelo relacional y el DDL real antes de copiarla a un documento o a un script.

## 2. Código que funciona "en el ejemplo" pero falla en el entorno real

La IA genera código para un entorno ideal y desconoce el estado real de la base de datos, los datos existentes o el orden en que se ejecutan los scripts.

**En este proyecto:** el código del módulo Estado académico (Prompt 12) asumía un esquema vacío. En el esquema de un integrante ya existía una tabla `STUDENTS` de otro taller, con otras columnas. Esto produjo una cadena de errores (`ORA-02449`, `ORA-00955`, `ORA-00904`). También apareció un error de orden: los reportes de `03_dql.sql` usan funciones que se crean en `04_plsql.sql`, así que el script 04 debe ejecutarse primero.

**Cómo mitigarlo:** ejecutar todo el código generado en un entorno de pruebas, revisar cada error en lugar de ignorarlo y comparar los resultados con valores esperados (por ejemplo, cuántas filas debe devolver cada reporte).

## 3. Sugerencias genéricas que no se ajustan a las reglas del negocio

La IA responde con lo "típico" de un sistema académico, no con lo que pide nuestro caso.

**En este proyecto:**
- En el Prompt 1 propuso una entidad `PAGO` que no hace parte del alcance de Fundaobrera.
- En el Prompt 8 sugirió `attended IN ('Y', 'N')`, mientras que el grupo usa `'S'` y `'N'`.
- En el mismo prompt sugirió `CHECK (stratum BETWEEN 1 AND 6)`, una restricción que no quedó en el DDL final.

**Cómo mitigarlo:** el equipo decide las reglas a partir de los requerimientos y usa la IA solo como apoyo. Toda sugerencia se revisa contra las historias de usuario.

## 4. Confidencialidad y protección de datos personales

Lo que se escribe en una herramienta de IAg puede salir de la organización: se procesa en servidores de terceros y, según el servicio y su configuración, puede almacenarse o usarse para entrenar modelos. Un sistema académico maneja datos personales como el número de documento, la dirección, el teléfono, el correo y el estrato. En Colombia esos datos están protegidos por la Ley 1581 de 2012 (protección de datos personales / habeas data).

**En este proyecto:** se trabajó solo con datos ficticios (estudiantes "900000001", "Dirección de prueba", correos `@example.com`). En un caso real, pegar en un chat de IA una exportación de la base de Fundaobrera expondría información de los estudiantes.

**Cómo mitigarlo:** no compartir datos reales, credenciales ni código propietario con herramientas no autorizadas por la organización; anonimizar los ejemplos; y usar solo versiones empresariales con acuerdos de confidencialidad cuando la empresa las provea.

## 5. Seguridad y operaciones destructivas

La IA puede proponer comandos que borran información o debilitan la seguridad, sin advertir del todo sus consecuencias. También puede generar código vulnerable, por ejemplo SQL dinámico construido concatenando texto, que es la puerta a la inyección SQL.

**En este proyecto:** para resolver el problema de la tabla vieja, la IA propuso `DROP TABLE students CASCADE CONSTRAINTS PURGE`. Ese comando borra la tabla sin pasar por la papelera y elimina las llaves foráneas de otras tablas que la referencian. Antes de ejecutarlo se consultó `USER_CONSTRAINTS` para saber qué tabla dependía de ella. En una base de producción, un comando así sin revisión podría causar pérdida de datos.

**Cómo mitigarlo:** nunca ejecutar en producción un `DROP`, `DELETE`, `TRUNCATE` o cambio de permisos sugerido por una IA sin entender qué hace, sin respaldo y sin la aprobación de quien administra la base.

## 6. Responsabilidad profesional y dependencia

La IA no responde por los errores; el profesional sí. Si se copia código sin entenderlo, el profesional queda sin capacidad de explicarlo, mantenerlo o corregirlo, y con el tiempo pierde competencias.

**En este proyecto:** parte del código del módulo Estado académico se pidió completo a la IA . Para no quedarse en "copiar y pegar", el código se ejecutó, se probó con casos que debían fallar (por ejemplo, intentar guardar un motivo de retiro en una matrícula que se está cursando) y se revisó antes del commit.

**Cómo mitigarlo:** cada integrante debe poder explicar el código de su módulo; usar la IA para entender y no solo para producir; y someter el código generado a la misma revisión (Pull Request) que el código escrito a mano.

## 7. Propiedad intelectual, honestidad académica y trazabilidad

El código generado puede parecerse a código con licencia. Además, presentar como propio un trabajo hecho con IA sin declararlo es un problema ético, tanto en la universidad como en una empresa. Las respuestas de la IA tampoco son reproducibles: la misma pregunta puede dar respuestas distintas.

**En este proyecto:** todo el uso de IA quedó registrado en la [Bitácora de prompts](Bitacora%20de%20prompts.md), con la pregunta, un resumen de la respuesta y la verificación que hizo el equipo.

**Cómo mitigarlo:** declarar siempre el uso de IAg, mantener una bitácora y revisar las políticas de la organización sobre el uso de código generado.

## Conclusión

La IA generativa aceleró tareas del proyecto: proponer entidades, redactar escenarios, escribir consultas y diagnosticar errores de Oracle. Sin embargo, en este mismo proyecto dio información que no correspondía al modelo, propuso reglas genéricas, generó código que falló en un entorno real y sugirió un comando destructivo. En un contexto profesional, la IAg debe tratarse como un asistente cuyo trabajo siempre se verifica, nunca como una fuente confiable por sí misma. La responsabilidad sobre los datos, la seguridad y la calidad del sistema sigue siendo del equipo.

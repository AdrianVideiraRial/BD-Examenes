## Examen: Administrar una BD Relacional

Vinculado al tema https://www.apuntesinformaticafp.com/cursos/administrar_una_bdr.html
Guía de evaluación (sobre 100 puntos)

Salvo que diga lo contrario, cada subtarea son 5p.

Todas las respuestas irán en archivos.sql. El nombre del archivo lo pongo en el título.

Puedes trabajar sobre la misma base de datos (aunque las tablas no sean muy coherentes entre sí). Recuerda borrar la base de datos al final y que quede ordenado tu sistema.
## Creación de una bd (p1.sql) .30p

En el archivo p1.sql pones todas las instrucciones sql de este problema. Configura correctamente las claves y los tipos de datos.

    - Crea una base de datos que se llame ejemplo
    - Crea el esquema esq1
    - Añade la tabla1 que guardará el dni y nombre de una persona. tabla1 estará en el esquema esq1
    - Añáde la tabla2 que guardará el id de un pedido y el dni (que será una clave ajena a tabla1(dni).
    - Añádele el campo edad a tabla1. Y añade la restricción de que el valor sea entre 0 y 99
    - Añádele el campo precio a tabla2. Que al menos guarde 4 dígitos decimales de precisión y hasta 9999 de valor sin decimal.

## Lenguaje DML (p2.sql) . 20p

Usando el modelo de datos del ejemplo: https://github.com/openacs/openacs-core/blob/main/packages/acs-kernel/sql/postgresql/acs-objects-create.sql

    - Dime un ejemplo de inserción de datos en acs_objects que tenga algunos campos
    - Dime un ejemplo de inserción de datos en acs_objects que tenga todos los campos de la tabla
    - Cómo harías para actualizar "title" a "Ejemplo de título" para los object_id mayores de 100
    - Cómo harías para borrar los registros modificados (modifying_ip) desde la IP 200.200.200.200

## Normalización (p3.sql) 20p

Realiza el diseño físico de

    - Matricula (dni, nombres, apellidos, asignatura). Recuerda que tiene que estar normalizado.

## Normalización (p4.sql) 30p

Realiza el diseño físico de

    - Recuerdos(idFoto, idPersona, nombre, dni, títuloFoto, fecha,monumento, ciudad, antigüedadMonumento). Recuerda que tiene que estar normalizado.
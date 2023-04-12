## Examen: Administrar una BD Relacional

Vinculado al tema https://www.apuntesinformaticafp.com/cursos/administrar_una_bdr.html
Guía de evaluación (sobre 100 puntos)

Salvo que diga lo contrario, cada subtarea son 5p.

Todas las respuestas irán en archivos.sql. El nombre del archivo lo pongo en el título.

Puedes trabajar sobre la misma base de datos (aunque las tablas no sean muy coherentes entre sí). Recuerda borrar la base de datos al final y que quede ordenado tu sistema.
## Creación de una bd (p1.sql) .30p

En el archivo p1.sql pones todas las instrucciones sql de este problema. Configura correctamente las claves y los tipos de datos.

    - Crea una base de datos que se llame ejemplo
  ![p1](/Examen%202/Imagenes/p1-%20createdb%20ejemplo.JPG)
    - Crea el esquema esq1
  ![p1](/Examen%202/Imagenes/p1-%20create%20schema%20esq1.JPG)
    - Añade la tabla1 que guardará el dni y nombre de una persona. tabla1 estará en el esquema esq1
  ![p1](/Examen%202/Imagenes/p1-%20createTable%20tabla1.JPG)
    - Añáde la tabla2 que guardará el id de un pedido y el dni (que será una clave ajena a tabla1(dni).
  ![p1](/Examen%202/Imagenes/p1-%20createTable%20tabla2.JPG)
    - Añádele el campo edad a tabla1. Y añade la restricción de que el valor sea entre 0 y 99
  ![p1](/Examen%202/Imagenes/p1-%20alterTable%20tabla1.JPG)
    - Añádele el campo precio a tabla2. Que al menos guarde 4 dígitos decimales de precisión y hasta 9999 de valor sin decimal.
  ![p1](/Examen%202/Imagenes/p1-%20alterTable%20tabla2.JPG)

## Lenguaje DML (p2.sql) . 20p

Usando el modelo de datos del ejemplo: https://github.com/openacs/openacs-core/blob/main/packages/acs-kernel/sql/postgresql/acs-objects-create.sql

    - Dime un ejemplo de inserción de datos en acs_objects que tenga algunos campos.

INSERT INTO acs_objects (object_id, object_type, context_id, security_inherit_p, creation_date, last_modified) 
VALUES (1,'example_of_data_object_type', 545, FALSE, DATE, CURRENT_TIMESTAMP);  

    - Dime un ejemplo de inserción de datos en acs_objects que tenga todos los campos de la tabla.

  INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, security_inherit_p, creation_user, creation_date, creation_ip, last_modified, modifying_user, modifying_ip) 
VALUES (2,'data_for_object_type', 'new_title', 108, 2, TRUE, 100, DATE, '255.255.255.255', CURRENT_TIMESTAMP, 80, '192.255.255.0);


    - Cómo harías para actualizar "title" a "Ejemplo de título" para los object_id mayores de 100.


    - Cómo harías para borrar los registros modificados (modifying_ip) desde la IP 200.200.200.200



## Normalización (p3.sql) 20p

Realiza el diseño físico de

    - Matricula (dni, nombres, apellidos, asignatura). Recuerda que tiene que estar normalizado.
  
  He dividido la MATRICULA en tres tablas para separar los datos de forma independiente (atómica), De esta forma podemos insertar diferentes alumnos que se matricularán en diferentes asignaturas establecemos esta relación en una tercera tabla con el identificador único de cada ALUMNO y ASIGNATURA. El esquema lógico resultante sería este:

![p3](/Examen%202/Imagenes/p3-%20Logico.JPG)

El diseño físico está en el archivo p3.sql:

![p3](/Examen%202/Imagenes/p3-%20dise%C3%B1oFisico.JPG)

Relaciones de tablas:

![p3](/Examen%202/Imagenes/p3-%20Normalizaci%C3%B3n.JPG)

## Normalización (p4.sql) 30p

Realiza el diseño físico de

    - Recuerdos(idFoto, idPersona, nombre, dni, títuloFoto, fecha,monumento, ciudad, antigüedadMonumento). Recuerda que tiene que estar normalizado.

Este caso es un poco mas complejo que el anterior, en este caso he dividido la tabla RECUERDOS en 4 "subtablas": FOTO, PERSONA, MONUMENTOS, RECUERDOS.
Haciendo que los datos sean indivisibles en cada tabla e identificando los datos de cada tabla con un identificador único (PK) el cual me permitirá relacinar diferentes MONUMENTOS con cada FOTO y diferentes PERSONAS que aparezcan en cada foto en la tabla RECUERDOS.

El esquema lógico seria este:

![p4](/Examen%202/Imagenes/p4-%20Logico.JPG)

El diseño físico está en el archivo p4.sql:

![p4](/Examen%202/Imagenes/p4-%20dise%C3%B1oFisico.JPG)

Relaciones de tablas:

![p4](/Examen%202/Imagenes/p4-%20Normalizaci%C3%B3n.JPG)
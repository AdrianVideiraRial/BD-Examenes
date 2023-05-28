Examen: Programando el SGBDR


## Usando funciones nativas en Postgres. 20p

Me adjuntas el código directamente para ejecutar en consola. Por ejemplo si te digo que me digas cuanto es 4 más 5, responderías SELECT 4 + 5;

Dime qué funciones podrían resolverme estos problemas:

    1. Quiero crear un número aleatorio entre el 5 y el 30.
    SELECT FLOOR(RANDOM() * (30 - 5 + 1) + 5) AS numero_aleatorio;

    2. ¿Cuanto es 4 elevado a 5?
    SELECT power(4, 5) AS resultado;

    3. Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2
    CREATE SEQUENCE seq_01 INCREMENT BY 2;
    SELECT nextval('seq_01');


    4. ¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
    SELECT currval('seq_01');

    5. ¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”, usando un intervalo de 3 días?
    SELECT date_trunc('day', '2001-07-27'::date) + INTERVAL '3 days' + INTERVAL '12 hours' AS fecha;


    6. ¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
    SELECT extract('hour' FROM ('08:45'::time - '07:30'::time)) AS horas;

    7. ¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
    SELECT extract('second' FROM '2001-02-16 20:38:40'::timestamp) AS segundos;


    8. ¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
    SELECT 'Hola, me llamo' || 'Pepe' AS resultado;
   
    9.  ¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?
    SELECT replace(replace('Hola soy Pepe', 'o', ''), 'e', '') AS resultado;



## Creando funciones (en SQL). 30p

Implementa las siguientes funciones:

    1. suma(n1,n2,n3). Crea una función que sume los dos primeros argumentos, y lo multiplique por un tercero. Los argumentos serán enteros.

    CREATE FUNCTION suma (x integer, y integer, z integer) RETURNS integer
    AS
    $$ SELECT (x+y)*z;
    $$ LANGUAGE SQL;

    SELECT suma(5,7,3) AS resultado_suma;

    
    2. actualizar_bicis(codigo). Sobre la BD Hubway, quiero cambiar todos los valores de los códigos de las bicis que están a null, con un valor que yo quiero escoger. Por ejemplo actualizar_bicis('000000').

    CREATE FUNCTION cambiar_codigo_bicicletas (cod varchar(6)) RETURNS VOID
    AS
    $$
    UPDATE trips SET bike_number = cod WHERE bike_number IS NULL;
    $$ LANGUAGE SQL;

    SELECT cambiar_codigo_bicicletas('000000');
   
    3. duracion_viaje(id,tipo). Necesito saber la duración de un viaje, en minutos o en horas, según el parámetro sea M o H. Por ejemplo duracion_viaje(4300,'M')

    CREATE OR REPLACE FUNCTION duracion_viaje(viaje_id integer, tipo text)
    RETURNS numeric AS
    $$
    SELECT CASE
         WHEN tipo = 'M' THEN EXTRACT(EPOCH FROM (end_date - start_date)) / 60
         WHEN tipo = 'H' THEN EXTRACT(EPOCH FROM (end_date - start_date)) / 3600
    ELSE NULL
    END
    FROM trips
    WHERE viaje_id = id;
    $$ LANGUAGE SQL;

    SELECT duracion_viaje(10, 'M');


## Creando funciones (en PL/pgSQL). 30p

Sobre la BD de Hubway, implementa las siguientes funciones usando PL/pgPSQL:

    1. actualiza_viaje(viaje, factor). Actualizar la duración para un viaje concreto. Es decir la nueva duración será la que tiene multiplicada por factor. Devolverá el número de viajes realizado desde la misma estación de origen.

    CREATE OR REPLACE FUNCTION actualiza_viaje(id_viaje integer, factor integer)
    RETURNS numeric AS
    $$
    DECLARE
        duracion_viaje numeric;
        nueva_duracion numeric;
    BEGIN
        SELECT end_date - start_date INTO duracion_viaje
        FROM trips
        WHERE id = id_viaje;
        
        nueva_duracion := duracion_viaje*factor;

        UPDATE trips SET duration = nueva_duracion WHERE id = id_viaje;

        RETURN nueva_duracion;
    END;
    $$ LANGUAGE plpgsql;

    SELECT actualiza_viaje(10,5);



    2. contar_viajes_mes(mes, referencia). Devuelve un entero con los viajes que se hicieron en un mes concreto (siendo 1 - enero y 12 - diciembre). Lanzará también un aviso en consola (RAISE NOTICE) clasificándolo en pocos / normal / muchos. El umbral de decisión será de 0,25 el valor de referencia (para pocos), 0,5 para normal y 0,75 muchos.
    
    CREATE OR REPLACE FUNCTION contar_viajes_mes(mes integer, referencia integer)
    RETURNS integer AS
    $$
    DECLARE
        viajes INTEGER;
        pocos FLOAT := referencia * 0.25;
        normal FLOAT := referencia * 0.5;
        muchos FLOAT := referencia * 0.75;
        aviso VARCHAR;
    BEGIN
        -- Contamos los registros que contienen la condición del mes pasado por parámetro.
        SELECT COUNT(*) INTO viajes FROM trips WHERE EXTRACT(month FROM start_date) = mes;

        -- Creamos la estructura de control con las condiciones.
        IF viajes <= pocos THEN
            aviso := 'Pocos' ;
        ELSIF viajes <= normal THEN
            aviso := 'Normal';
        ELSE 
            aviso := 'Muchos';
        END IF;

        RAISE NOTICE 'Se realizaron % viajes siendo su cantidad %', viajes, aviso;

        RETURN viajes;
    END;
    $$ LANGUAGE plpgsql;

    SELECT contar_viajes_mes(3,100);

    3. borra_y_guarda(id). Crea una función que borre el viaje con ese id. Además guardará en un log (tabla viajes_borrados) un registro del tipo «El usuario $U borró el viaje $V», además el timestamp del borrado

    CREATE TABLE viajes_borrados (usuario VARCHAR, id INTEGER, fecha TIMESTAMP);

    CREATE OR REPLACE FUNCTION borrar_guardar(id_viaje integer)
    RETURNS integer AS
    $$
    DECLARE
    usuario VARCHAR;
    BEGIN
        -- Asignamos el usuario actual a la variable usuario.
        usuario := current_user;
        -- Eliminamos el resgistro de la tabla trips que coincida con el id del parámetro.
        DELETE FROM trips WHERE id = id_viaje;
        -- Rellenamos la tabla viajes_borrados con el registro de la operación.
        INSERT INTO viajes_borrados (usuario, id, fecha) VALUES ('EL usuario ' || usuario ||' borro el viaje '|| id_viaje, current_timestamp);
    END;
    $$ LANGUAGE plpgsql;  

    SELECT borrar_guardar(20);


## Creando Triggers. 20p

Sobre la BD Huway, implementa los siguientes disparadores:

    1. act_duracion_t. Al actualizar un viaje, comprobará que al menos la duración es de 20 segundos. Si no lo es, lo actualizará para que sea ese valor.
   

    CREATE OR REPLACE FUNCTION verificar_duracion()
    RETURNS TRIGGER AS
    $$
    BEGIN
        IF NEW.duration < 20 THEN
        NEW.duration := 20;
        END IF;
    RETURN NEW;
    END;

    $$ LANGUAGE plpgsql;

    CREATE TRIGGER act_duracion_t
    BEFORE UPDATE ON trips
    FOR EACH ROW
    EXECUTE FUNCTION verificar_duracion();


    2. check_municipio_t. Cuando se actualice el municipio de una estación, garantizará que sea de un municipio que esté previamente en la tabla. En el caso de que no exista ese municipio previamente no se aceptarán municipios nuevos.

    
    

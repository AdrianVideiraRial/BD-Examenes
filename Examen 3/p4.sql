/*1- Ver los valores nulos (si hay) en el campo start_station*/

SELECT * FROM trips
WHERE start_station IS NULL;

/* 2-Actualizar todos los valores de start_station, si tienen valores nulos, para que sean iguales al valor de end_station para ese registro. */

UPDATE trips
SET start_station = end_station 
WHERE start_station IS NULL;

/* 3-Para arreglar este tema en el futuro, ¿qué instrucción de modificación DDL tendríamos que ejecutar? */

-- Deberíamos usar la instruccion NOT NULL en los campos donde actualmente se permiten valores nulos
-- de esta manera obligaríamos siempre a introducir un tipo de valor que establezcamos.
-- También, podríamos no querer introducir ningún valor concreto en dicha columna y para eso usaríamos la instrucción DEFAULT
-- al insertar los datos en la tabla.
	
/* 4-Borra todos los registros que no tengan un valor conocido de birth_date */

DELETE FROM trips
WHERE birth_date IS NULL;

/* 5- Actualizar los valores nulos de bike_number para que tengan el valor B00000 */

UPDATE trips SET bike_number = 'B00000'
WHERE bike_number IS NULL;

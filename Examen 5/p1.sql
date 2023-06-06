-- 1. Le añades una tabla que se llame "frutas" con un campo que sea clave primaria y otro que permita usar JSON,
-- que guardará información sobre frutas.

CREATE TABLE frutas (
  id SERIAL PRIMARY KEY,
  datos JSONB
);

-- 2. Una fruta tiene varias propiedades:
--    i. Un nombre: naranja, pera, manzana, etc
--   ii. Un diámetro (en cm): 5, 10, 15, etc
--  iii. Un origen (ciudad): Vigo, Ourense, Santiago, etc

-- 3.Añade al menos 5 frutas a tu base de datos

INSERT INTO frutas (datos)
VALUES
  ('{"nombre": "naranja", "diametro": 10, "origen": "Vigo"}'),
  ('{"nombre": "pera", "diametro": 8, "origen": "Ourense"}'),
  ('{"nombre": "manzana", "diametro": 6, "origen": "Santiago"}'),
  ('{"nombre": "uva", "diametro": 2, "origen": "Lugo"}'),
  ('{"nombre": "kiwi", "diametro": 5, "origen": "Ourense"}');
  
-- 4.Ponme la consulta para mostrar las frutas que vienen de Ourense.

SELECT datos ->> 'nombre' AS Nombre
FROM frutas
WHERE datos ->>'origen' = 'Ourense';

-- 5.Muéstrame las frutas que comiencen por la letra N.

SELECT datos ->>'nombre' AS Nombre_Fruta
FROM frutas
WHERE datos ->>'nombre' LIKE 'n%';




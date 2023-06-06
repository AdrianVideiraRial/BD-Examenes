-- Trabajamos con la colección sales de la BD sample_supplies

use sample_supplies

-- 1. Muéstrame 3 pedidos (supplies) de la BD.

db.sales.aggregate([ { $limit: 3 } ])


-- 2. Muéstrame el promedio de edad de los clientes (customer) agrupado por tienda (storeLocation)

-- 3. ¿Cuántos clientes mujeres de más de 40 años han hecho pedidos en nuestra tienda?

-- 4. Muéstrame la tienda, el email del cliente y su edad, de los 5 pedidos con mejor valoración (satisfaction) de los clientes (customer)

/* 1- ¿Cual es el producto con el precio mínimo más bajo? (usando subconsultas) */

SELECT ProductName
FROM Products
WHERE Price = (SELECT MIN(Price)FROM Products);

/* 2- ¿Cual es el producto cuyo precio sea al menos 10 veces el pedido mínimo (quantity) de los pedidos (OrderDetails)? */

SELECT ProductName
FROM Products
WHERE Price = (SELECT (MIN(Price)*10)FROM Products);

/* 3- ¿Cuales son los registros de productos (Products) cuyo precio (price) sea mayor que el máximo de los precios de los productos cuyo id sea 3, 6, 9 y 10?*/

SELECT ProductID, ProductName
FROM Products
WHERE Price > (SELECT MAX(Price) FROM Products WHERE ProductID = 3
OR ProductID = 6 OR ProductID = 9 OR ProductID = 10);

/* 4- ¿Cuales son los registros de productos (Products) cuyo ProductID sea un valor que esté en Shippers.ShipperID? */

SELECT ProductID, ProductName
FROM Products
WHERE ProductID = (SELECT ProductID FROM Shippers WHERE ProductID = ShipperID);

/* 5- ¿Qué clientes (Customers) tenemos registrados, que estén en ciudades de nuestros proveedores (Suppliers)? */



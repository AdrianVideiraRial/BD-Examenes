/* 1- Dime el nombre del cliente del pedido 10360 */

SELECT c.ContactName, o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
ON (c.CustomerID = o.CustomerID)
WHERE OrderID = 10360;

/* 2- Dime el nombre completo de los clientes con los pedidos 10360, 10253 y 10440 */

SELECT c.ContactName, o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
ON (c.CustomerID = o.CustomerID)
WHERE OrderID = 10360 OR OrderID = 10253 OR OrderID=10440;

/* 3- Dime las ciudades y número de pedidos de clientes en esa ciudad */

SELECT c.City, COUNT(o.OrderID)
FROM Customers AS c
INNER JOIN Orders AS o
ON (c.CustomerID = o.CustomerID)
GROUP BY c.City
ORDER BY COUNT (o.OrderID) DESC;

/* 4- ¿Cuales son las ciudades desde las que hay más de 7 pedidos? */

SELECT COUNT(o.OrderID), c.City
FROM Customers AS c
INNER JOIN Orders AS o
ON (c.CustomerID = o.CustomerID)
GROUP BY City
HAVING COUNT(o.OrderID) > 7;

/* 5- ¿Cuales son los tres países desde los que tengo más pedidos? */

SELECT c.Country, COUNT(o.OrderID)
FROM Orders AS o
INNER JOIN Customers AS c
ON (o.CustomerID = c.CustomerID)
GROUP BY c.Country
ORDER BY COUNT(o.OrderID) DESC
LIMIT 3;

/* 6- Necesito un informe con el Nombre completo de los Empleados y el número de pedidos que registraron */

SELECT('El empleado: ' || e.FirstName || ' ' || e.LastName || ' registro: ' || COUNT(o.OrderID) || ' pedidos')
FROM Employees AS e
INNER JOIN Orders AS o
ON (e.EmployeeID = O.EmployeeID)
GROUP BY e.EmployeeID
ORDER BY COUNT (o.OrderID) DESC;

/* 7- En el informe anterior, sólo necesito los empleados cuyo nombre comience por M */

SELECT('El empleado: ' || e.FirstName || ' ' || e.LastName || ' registro: ' || COUNT(o.OrderID) || ' pedidos')
FROM Employees AS e
INNER JOIN Orders AS o
ON (e.EmployeeID = O.EmployeeID)
WHERE e.FirstName LIKE 'M%'
GROUP BY e.EmployeeID
ORDER BY COUNT (o.OrderID) DESC;

/* 8- Quiero saber el número de pedido, qué empleado (sólo el nombre) lo registró y el cliente. */

SELECT o.OrderID, e.FirstName, c.CustomerID, c.ContactName
FROM Customers AS c
INNER JOIN Orders AS o ON (c.CustomerID = o.CustomerID)
INNER JOIN Employees AS e ON (o.EmployeeID = e.EmployeeID)
ORDER BY e.FirstName ASC;

/* 9- ¿Hay algún cliente que haya hecho más de un pedido registrado por el mismo empleado? */



/* 10- Quiero saber los clientes que hayan hecho más de un pedido y que hayan sido registrado por un Empleado cuyo nombre sea Margaret. */

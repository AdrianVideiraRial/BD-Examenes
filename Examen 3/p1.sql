/* 1- Revisa las tablas Customers (clientes), Employees (empleados) y Orders (pedidos) */

-- mostrar elementos de la tabla \d customers
SELECT * FROM customers;
-- mostrar elementos de la tabla \d employees
SELECT * FROM employees;
-- mostrar elementos de la tabla \d orders
SELECT * FROM orders;

/* 2- ¿Cuántos clientes hay registrados? */

SELECT COUNT(DISTINCT CustomerID) FROM Customers;

/* 3- ¿Cuántos pedidos? */

SELECT COUNT(DISTINCT OrderID) FROM Orders;

/* 4- ¿Qué clientes viven en Londes y su nombre (CustomerName) empieza por A?*/

SELECT CustomerID, ContactName FROM Customers
WHERE ContactName LIKE 'A%';

/* 5- ¿Cuántos clientes hay que son de Londres? */

SELECT CustomerID, ContactName, City, Address FROM Customers
WHERE City = 'London';

/* 6- ¿Cuántos clientes hay en cada ciudad? */

SELECT COUNT (CustomerID), City FROM Customers
GROUP BY City
ORDER BY COUNT (CustomerID) DESC;

/* 7- ¿Cuántos empleados nacieron después de 1 de Junio del 1965? */

SELECT EmployeeID, FirstName, LastName, BirthDate FROM Employees
WHERE BirthDate > '1965-06-01';

/* 8- Hazme un informe que diga «El empleado N nación el N», siendo N, nombre (FirstName y Last Name) y día de nacimiento (BirthDate).*/ 

SELECT ('El empleado ' || FirstName ||' ' || LastName || ' nacio en '|| BirthDate) FROM Employees;

/* 9- Hazme el informe anterior, pero sólo para los empleados con id 8, 7, 3 y 10. */

SELECT ('El empleado ' || FirstName ||' ' || LastName || ' nacio en '|| BirthDate)
FROM Employees
WHERE EmployeeID = 8 OR EmployeeID = 7 OR EmployeeID = 3 OR EmployeeID = 10;

/* 10- Dime los paises que tengan más de 5 clientes, ordenados por el nombre de país. */

SELECT COUNT(CustomerID), Country FROM Customers
GROUP BY Country
HAVING COUNT (CustomerID) > 5
ORDER BY Country ASC;

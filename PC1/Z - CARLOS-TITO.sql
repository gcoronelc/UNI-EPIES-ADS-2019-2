-- NOMBRES:                        
/* 
CARLOS ENRIQUE TITO CANECILLAS                        
JOEL CHURAMPI ARRESCURRENAGA				  
*/


USE Northwind

--PREGUNTA 1--

SELECT  dbo.Orders.ShipCountry, SUM(dbo.Orders.OrderID) AS [Cantidad de Pedidos], COUNT(dbo.Products.ProductName) AS [Cantidad de Productos]
,dbo.Products.UnitPrice * COUNT(dbo.Products.ProductName) AS [Importe], dbo.Products.ProductName
FROM dbo.Orders CROSS JOIN
dbo.Products
GROUP BY dbo.Products.UnitPrice, dbo.Products.ProductName, dbo.Orders.ShipCountry
ORDER BY dbo.Orders.ShipCountry;


--PREGUNTA 2--
SELECT dbo.Customers.ContactName, dbo.Products.ProductName, COUNT(dbo.Orders.CustomerID) AS Cantidad
FROM dbo.Customers INNER JOIN
dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID CROSS JOIN
dbo.Products
GROUP BY dbo.Customers.ContactName, dbo.Products.ProductName
ORDER BY dbo.Customers.ContactName;


--PREGUNTA 3--
SELECT        dbo.Categories.CategoryName, 
dbo.Products.ProductName, 
COUNT(dbo.Orders.CustomerID) AS Cantidad,
dbo.Products.UnitPrice * COUNT(dbo.Orders.CustomerID) AS  Importe
FROM dbo.Categories INNER JOIN
dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID CROSS JOIN
dbo.Orders
GROUP BY dbo.Products.ProductName, dbo.Categories.CategoryName, dbo.Products.UnitPrice

--PREGUNTA 4--
SELECT        dbo.Employees.FirstName,SUM(dbo.[Order Details].UnitPrice) AS comision, COUNT(dbo.[Order Details].OrderID) AS Expr1
FROM            dbo.Employees CROSS JOIN
                         dbo.[Order Details]
GROUP BY dbo.Employees.FirstName
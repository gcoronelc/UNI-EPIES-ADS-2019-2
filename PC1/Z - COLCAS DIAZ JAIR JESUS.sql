USE Northwind
---ESTUDIANTE 1: COLCAS DIAZ JAIR JESUS 20141133A
---ESTUDIANTE 2: TIAHUALPA YUCRA YHON   20164537A

---PREGUNTA 1

SELECT A.[ShipCountry] AS 'Pais' , COUNT(DISTINCT A.[OrderID]) AS 'Cantidad de Pedidos', 
COUNT(B.[Quantity]) AS 'Cantidad de Productos',
SUM(B.[Quantity]*B.[UnitPrice]) AS 'Importe' 
from [dbo].[Orders] A , [dbo].[Order Details] B
WHERE A.OrderID=B.OrderID
GROUP BY [ShipCountry]


SELECT COUNT(DISTINCT [OrderID]) AS 'PEDIDOS TOTALES' FROM [dbo].[Orders]
SELECT SUM([Quantity]) AS 'PRODUCTOS TOTALES' FROM [dbo].[Order Details]
SELECT SUM([UnitPrice]*[Quantity]) AS 'IMPORTE TOTAL' FROM [dbo].[Order Details]

---PREGUNTA 3:

V2 AS 
(SELECT A.[CategoryName] AS 'Categoria' , B.[ProductName] AS 'Producto'
FROM  [dbo].[Categories] A , [dbo].[Products]  B 
WHERE A.[CategoryID]=B.[CategoryID]
ORDER BY A.[CategoryName]
)


---PREGUNTA 4:

SELECT Nombre =(E.FirstName + ' ' + E.LastName), Venta = (O.Quantity*O.UnitPrice), comision = (O.Quantity*O.UnitPrice *0.03)
FROM  [Order Details] O INNER JOIN
    Orders S ON O.OrderID = S.OrderID INNER JOIN
    Employees E ON S.EmployeeID = E.EmployeeID
order by nombre

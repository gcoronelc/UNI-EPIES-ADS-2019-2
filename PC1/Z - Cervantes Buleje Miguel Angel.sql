-- alumno 1: Cervantes Buleje Miguel Angel
-- alumno 2: Cueva Rojas Francisco Manuel



PREGUNTA1


with 
v1 as (
	SELECT [OrderID],SUM([Quantity])AS "CANTIDAD PRODUCTOS", SUM(Quantity*UnitPrice*(1-Discount)) AS "IMPORTE"
	FROM [Order Details] 
	GROUP BY OrderID
	)
select d.ShipCountry, COUNT(V1.OrderID) As "CANTIDAD DE PEDIDOS", SUM(v1.[CANTIDAD PRODUCTOS]) as "CANTIDAD PRODUCTOS", SUM(v1.IMPORTE) AS "IMPORTE"
from Orders d 
left join v1 on d.OrderID = v1.OrderID
GROUP BY ShipCountry
ORDER BY ShipCountry
GO

PREGUNTA 3

with
v3 as (
	SELECT [Order Details].ProductID,SUM(Quantity) AS "CANTIDAD", SUM(Quantity*[Order Details].UnitPrice*(1-Discount)) AS "IMPORTE"
	FROM [Order Details]
	GROUP BY [Order Details].ProductID
)
select a.ProductName, v3.CANTIDAD, v3.IMPORTE
from Products a
join v3 on a.ProductID = v3.ProductID
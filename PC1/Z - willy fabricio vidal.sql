/*  Estudiante 1: Willy Vidal Camayoc
	Estudiante 2: Rene Ramìrez Torres */

--Resol_1
With
PaisPedido as(
Select OrderID,count(1) [Cantidad Pedidos], 
sum(Quantity) [Cantidad Productos], sum(unitprice*quantity-discount) Importe
From Northwind.dbo.[Order Details]
Group By OrderID)

Select A.Country Pais,sum(PaisPedido.[Cantidad Pedidos]) [Cantidad Pedidos],sum(PaisPedido.[Cantidad Productos]) [Cantidad Productos],sum(PaisPedido.Importe) Importe
From Northwind.dbo.Customers A
Join Northwind.dbo.Orders B
On A.CustomerID=B.CustomerID
Join PaisPedido
On PaisPedido.OrderID=B.OrderID
Group By a.Country;

--Resol_3
SELECT A.[CategoryName] NOMBRE_CATEGORIA, 
	B.[ProductName] NOMBRE_PRODUCTO, 
	C.[Quantity] CANTIDAD, 
	C.UnitPrice*C.Quantity IMPORTE
FROM [dbo].[Categories] A 
INNER JOIN [dbo].[Products] B 
ON A.[CategoryID]=B.[CategoryID]
INNER JOIN [dbo].[Order Details] C
ON B.[ProductID]=C.[ProductID]
GROUP BY B.[ProductName]




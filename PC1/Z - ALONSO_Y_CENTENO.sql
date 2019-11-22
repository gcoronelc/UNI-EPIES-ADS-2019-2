--ESTUDIANTE 1: ALONSO MACHA ALEX DANIEL
--ESTUDIANTE 2: CENTENO DREYFFUS OSKAR :3

--Problema 1)
select C.Country,sum(OD.Quantity) as CantidadPedidos ,
count(OD.ProductID) as CantidadProductos,sum(OD.UnitPrice*OD.Quantity) as Importe 
from  [Northwind].[dbo].[Order Details] as OD inner join [Northwind].[dbo].[Orders] as O 
on OD.OrderID = O.OrderID inner join [Northwind].[dbo].[Customers] as C on O.CustomerID = C.CustomerID 
group by C.Country 
ORDER BY 1;

/*
Argentina	16	339	8119.10
Austria	40	5167	139496.63
Belgium	19	1392	35134.98
*/


--Problema 2)
select C.ContactName,P.ProductName,count(OD.ProductID) from  [Northwind].[dbo].[Customers] as C inner join
[Northwind].[dbo].[Orders] as O on C.CustomerID = O.CustomerID inner join [Northwind].[dbo].[Order Details] as OD
on O.OrderID = OD.OrderID inner join [Northwind].[dbo].[Products] as P on OD.ProductID =P.ProductID
 group by C.ContactName,P.ProductID ,P.ProductName 

 --Problema 3)
select C.CategoryName, P.ProductName,
	count(OD.ProductID) as Cantidad ,
	sum(OD.ProductID*OD.Quantity)as Importe  from [Northwind].[dbo].[Categories] as C
inner join [Northwind].[dbo].[Products] as P on C.CategoryID=P.CategoryID inner join [Northwind].[dbo].[Order Details] as OD on
OD.ProductID=P.ProductID group by C.CategoryName, P.ProductName 


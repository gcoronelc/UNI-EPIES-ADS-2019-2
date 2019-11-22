USE Northwind

-------------------PREGUNTA 1---------------

select 
	v1.country, 
	COUNT(V1.ORDERID) AS cant_pedidos, 
	COUNT(distinct v1.ProductID) as cant_productos, 
	SUM(V1.IMPORTE) 
from (
	select distinct v2.country, d.ProductID, v2.OrderID, cant , sum(d.UnitPrice) aS IMPORTE from 
(
SELECT distinct A.Country, b.OrderID, b.CustomerID, count(1) as cant
FROM [dbo].[Customers] A
 JOIN [dbo].[Orders] B
ON A.CustomerID=B.CustomerID
group by a.country, b.orderid, b.CustomerID

) v2
join [dbo].[Order Details]  d
 on v2.OrderID=d.[OrderID]
 GROUP BY Country, ProductID, V2.OrderID, CANT

)v1 group by country 
order by 1;


/*
Rpta. Prof
Argentina	16	339	8119.10
Austria		40	5167	139496.63
Belgium		19	1392	35134.98
Brazil		83	4247	114968.48
Canada	30	1984	55334.10
*/

/**************************************************
-------------------PREGUNTA 2---------------*/



select v1.customerid,c.ProductName, COUNT(V1.ORDERID) AS CANTIDAD from (

select distinct  v2.CustomerID, d.ProductID, v2.OrderID, cant , sum(d.UnitPrice) aS IMPORTE from 
(
SELECT distinct  b.OrderID, b.CustomerID, count(1) as cant
FROM [dbo].[Customers] A
 JOIN [dbo].[Orders] B
ON A.CustomerID=B.CustomerID
group by  b.orderid, b.CustomerID

) v2
join [dbo].[Order Details]  d
 on v2.OrderID=d.[OrderID]
 GROUP BY v2.CustomerID, ProductID, V2.OrderID, CANT

)v1 
join [dbo].[Products] c
on v1.ProductID=c.ProductID
group by customerid,c.ProductName




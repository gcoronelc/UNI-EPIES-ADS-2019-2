/*
- JIMENEZ VERA
- SALAZAR FLORES
*/

use Northwind;
go

/*pregunta 1 */

select Cu.Country as PAIS, count(OrD.Quantity) as CANTIDAD_PEDIDOS, 
	sum(OrD.Quantity) as CANTIDAD_PRODUCTOS, 
sum(OrD.UnitPrice*OrD.Quantity) as IMPORTE 
from Customers as Cu inner join Orders as Ors on Cu.CustomerID=Ors.CustomerID
					 inner join [Order Details] as OrD on Ors.OrderID=OrD.OrderID
group by Cu.Country
order by Cu.Country
	
/*pregunta 2 */
	  
with
v1 as (	select k.NOMBRE_CLIENTE,k.NOMBRE_PRODUCTO, k.CANTIDAD, rank() over (partition by k.NOMBRE_CLIENTE order by k.CANTIDAD desc) as Rnk 
		from 
		(select  Cu.ContactName as NOMBRE_CLIENTE, Pr.ProductName as NOMBRE_PRODUCTO, sum(OrD.Quantity) as CANTIDAD
		from Customers as Cu inner join Orders as Ors on Cu.CustomerID=Ors.CustomerID
							 inner join [Order Details] as OrD on Ors.OrderID=OrD.OrderID
							 inner join Products as Pr on OrD.ProductID=Pr.ProductID
		group by Pr.ProductName, Cu.ContactName) as k
		group by k.CANTIDAD, k.NOMBRE_PRODUCTO, k.NOMBRE_CLIENTE
	  )
select NOMBRE_CLIENTE, NOMBRE_PRODUCTO, CANTIDAD 
from v1
where Rnk<2
order by NOMBRE_CLIENTE

/*pregunta 3 */

select Ca.CategoryName as NOMBRE_CATEGORIA, Pr.ProductName as NOMBRE_PRODUCTO, sum(OrD.Quantity) as CANTIDAD, sum(OrD.Quantity*OrD.UnitPrice) as IMPORTE
from [Order Details] as OrD inner join Products as Pr on OrD.ProductID=Pr.ProductID
							inner join Categories as Ca on Pr.CategoryID=Ca.CategoryID
group by Pr.ProductName, Ca.CategoryName
order by Ca.CategoryName, Pr.ProductName

select * from Customers

/*pregunta 4 */

Select [LastName]+' '+ [FirstName] as EMPLEADO,Count(*) as VENTAS, sum(0.03*O.UnitPrice*O.Quantity)as COMISION 
From [dbo].[Employees] E Inner Join [dbo].[Orders] P On E.[EmployeeID]=P.[EmployeeID]
					     Inner Join [dbo].[Order Details] O On O.OrderID=P.OrderID
Group By [LastName]+' '+[FirstName] 		

	
select * from [Order Details]
Paolo Ugarte MEdina
daniel huachaca


Pregunta 1:
________________________________________
select a.OrderID, sum(b.UnitPrice*b.Quantity) as Importe,
sum(b.Quantity) as CantidadProductos,
c.Country as Pais
into tablatmp1
from Orders a
left join [Order Details] b
on a.OrderID=b.OrderID
left join Customers c
on a.CustomerID=c.CustomerID
group by a.OrderID, c.Country;

select Pais, count(OrderID) as CantidadPedidos,
sum(CantidadProductos) as CantidadProductos,
sum(Importe) as Importe
from tablatmp1 a
group by Pais;

______________________________________________________

pregunta 2

______________________________________________________


select a.ContactName, b.OrderID, c.ProductID, c.Quantity, d.ProductName into tablatmp2
from Customers a
left join Orders b
on a.CustomerID=b.CustomerID
left join [Order Details] c
on b.OrderID=c.OrderID
left join Products d
on c.ProductID=d.ProductID;

select a.ContactName as NombreCliente, a.ProductName as NombreProducto, sum(a.Quantity) as Cantidad
from tablatmp2 a
group by a.ContactName, a.ProductName;

_____________________________________________________

pregunta 3

______________________________________________________

select  c.CategoryName, a.ProductName, sum(b.Quantity) as Cantidad, sum(b.unitprice*b.Quantity) as Importe
from Products a
left join [Order Details] b
on a.ProductID=b.ProductID
left join Categories c
on a.CategoryID=c.CategoryID
group by c.CategoryName, a.ProductName;

_____________________________________________________

pregunta 4

______________________________________________________


select concat(a.FirstName,' ',a.LastName) as Empleado,
d.ProductName,
sum(c.Quantity) as Cantidad, sum(c.unitprice*c.Quantity) as Importe

from Employees a
left join Orders b
on a.EmployeeID=b.EmployeeID
left join [Order Details] c
on b.OrderID=c.OrderID
left join Products d
on c.ProductID=d.ProductID
group by concat(a.FirstName,' ',a.LastName), d.ProductName;


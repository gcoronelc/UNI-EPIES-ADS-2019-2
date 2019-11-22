

/*PREGUNTA NUMERO 1*/

SELECT 
	country AS PAIS, 
	COUNT(pedidos.customerid) AS CANTIDAD_PEDIDOS, SUM(pedidos.freight) AS IMPORTE
FROM customers country inner join orders pedidos on country.customerid=pedidos.customerid 
group by country
ORDER BY 1;




/*PREGUNTA NUMERO 2*/
select productname AS NOMBRE_PRODUCTO, unitsonorder AS CANTIDAD
from products
where unitsonorder= (SELECT MAX(unitsonorder)from products );

/*PREGUNTA NUMERO 3*/

select A.[CategoryName],B.[ProductName],B.[UnitsInStock] as Cantidad
from [dbo].[Categories] A inner join [dbo].[Products] B
on A.[CategoryID]=B.[CategoryID] inner join 
[dbo].[Order Details] C
on C.[ProductID]=C.[ProductID] group by A.[CategoryID],A.[CategoryName],B.[ProductName],B.[UnitsInStock];


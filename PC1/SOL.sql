-- Pregunta 1
-- =================

SELECT * 
FROM DBO.Orders O
JOIN DBO.[Order Details] OD
ON O.OrderID = OD.OrderID;

SELECT 
	O.ShipCountry Pais,
	count(distinct o.orderid) pedidos,
	sum(od.Quantity) Productos,
	sum(od.UnitPrice * od.Quantity) importe
FROM DBO.Orders O
JOIN DBO.[Order Details] OD
ON O.OrderID = OD.OrderID
group by o.ShipCountry
order by 1;

/*
Argentina	16	339	    8119.10
Austria	    40	5167	139496.63
Belgium	    19	1392	35134.98
Brazil	    83	4247	114968.48
Canada	    30	1984	55334.10
*/

-- Pregunta 2
-- =================
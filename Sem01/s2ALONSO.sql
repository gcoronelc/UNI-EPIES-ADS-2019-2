WITH
V2 AS 
(
	SELECT [iddepartamento], COUNT(1) AS CANT_EMP
	FROM RH.[dbo].[empleado]
	GROUP BY [iddepartamento]
	HAVING COUNT(1)>5
)
SELECT V2.[iddepartamento],D.[nombre],V2.CANT_EMP
FROM RH.[dbo].[departamento] D
JOIN V2 ON D.[iddepartamento]=V2.iddepartamento;

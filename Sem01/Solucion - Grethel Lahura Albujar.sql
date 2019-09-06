----Desarrolle una sentencia SELECT promedio por departamento. Base de datos RH-----

USE RH 

CREATE TABLE [dbo].[midepartamento](
	[iddepartamento] [varchar] (50) NOT NULL,
	[sal prom] [float] NOT NULL
);
GO

INSERT INTO [dbo].[midepartamento]([iddepartamento], [sal prom])
select iddepartamento, avg(sueldo) sal_prom
from RH.dbo.empleado
group by iddepartamento;


UPDATE [dbo].[midepartamento]
set [iddepartamento]=CONCAT(b.[iddepartamento],' ',b.nombre)
from   [dbo].[midepartamento]as a,[dbo].[departamento] as b
where a.[iddepartamento]=b.[iddepartamento];

SELECT * FROM [dbo].[midepartamento];




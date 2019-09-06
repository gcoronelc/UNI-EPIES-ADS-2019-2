with
v1 as (
	select iddepartamento,count (1) cant_emp
	from rh.[dbo].[empleado]
	group by iddepartamento
	having count(1)>5
)
select v1.iddepartamento,d.nombre, v1.cant_emp
from RH.dbo.departamento d
join v1 on d.iddepartamento=v1.iddepartamento;

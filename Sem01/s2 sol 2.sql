with
v2 as (
	select iddepartamento , count(1) cant_emp
	from RH.dbo.empleado
	group by iddepartamento
)
select v2.iddepartamento , A.nombre, v2.cant_emp
from RH.dbo.departamento A
join v2 on A.iddepartamento = v2.iddepartamento
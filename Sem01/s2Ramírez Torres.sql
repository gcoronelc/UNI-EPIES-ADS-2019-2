with
v1 as(
    Select iddepartamento, COUNT(1) cant_emp
	from RH.dbo.empleado
	group by iddepartamento
	having COUNT(1)>5
	)
select v1.iddepartamento, a.nombre,v1.cant_emp
from rh.dbo.departamento a
join v1 on a.iddepartamento=v1.iddepartamento;
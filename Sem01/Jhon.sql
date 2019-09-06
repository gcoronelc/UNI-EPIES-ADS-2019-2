select  A.iddepartamento , B.nombre ,avg(A.sueldo) sal_prom
from [dbo].[empleado] A, [dbo].[departamento] B
where A.iddepartamento = B.iddepartamento
group by A.iddepartamento, B.nombre;



-- Aporte del profe

select  A.iddepartamento , B.nombre ,avg(A.sueldo) sal_prom
from    rh.[dbo].[empleado] A
join    rh.[dbo].[departamento] B
on      A.iddepartamento = B.iddepartamento
group by A.iddepartamento, B.nombre;






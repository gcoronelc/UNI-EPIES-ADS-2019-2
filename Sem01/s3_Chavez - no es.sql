--28. Desarrolle una sentencia SELECT para encontrar el importe recaudado por curso.Base de datos EDUCA.

select [cur_id], sum(cur_precio) importe_recaudado
from EDUCA.dbo.CURSO
GROUP BY cur_id;

with
v3 as (
	select cur_id, sum(cur_precio) importe_recaudado
	from EDUCA.dbo.CURSO
	GROUP BY cur_id
)
select v3.cur_id, n.cur_nombre, v3.importe_recaudado
from EDUCA.dbo.CURSO n
join v3 on n.cur_id=v3.cur_id;
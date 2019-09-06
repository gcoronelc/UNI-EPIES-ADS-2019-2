with
v4 as (
	select A.cur_id ,sum(A.pag_importe) pago_importe,COUNT(B.ALU_ID) Alumnos_Matriculados
	from EDUCA.[dbo].[PAGO] A,EDUCA.[dbo].[ALUMNO] B
	group by cur_id
)
select v4.cur_id,d.CUR_nombre,V4.Alumnos_Matriculados,v4.pago_importe
from EDUCA.dbo.[curso] d
join v4 on d.cur_id=v4.cur_id;

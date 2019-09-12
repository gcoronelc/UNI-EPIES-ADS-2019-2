use EDUCA

select A.cur_id, A.cur_nombre , COUNT( DISTINCT alu_id) Alumnos_Matriculados, SUM(B.pag_importe) Importe_Recaudado
from [dbo].[PAGO] B
JOIN [dbo].[CURSO] A
ON A.cur_id = B.cur_id
group by A.cur_id, A.cur_nombre;

select * from dbo.MATRICULA;


select  A.cur_nombre , SUM(B.pag_importe) Importe_Recaudado
from [dbo].[PAGO] B
JOIN [dbo].[CURSO] A
ON A.cur_id = B.cur_id
group by A.cur_nombre;


-- aporte del profe

select  a.cur_id,  A.cur_nombre , SUM(B.pag_importe) Importe_Recaudado
from [dbo].[PAGO] B
JOIN [dbo].[CURSO] A
ON A.cur_id = B.cur_id
group by a.cur_id, A.cur_nombre;


select * from educa.dbo.PAGO;




/*
Desarrolle una sentencia SELECT para encontrar 
el salario promedio por departamento. 
Base de datos RH.
*/

select iddepartamento, avg(sueldo) sal_prom
from RH.dbo.empleado
group by iddepartamento;

/*   
Cambio: Agregar el nombre del departamento
*/

with 
v1 as (
	select iddepartamento, avg(sueldo) sal_prom
	from RH.dbo.empleado
	group by iddepartamento
)
select v1.iddepartamento, d.nombre, v1.sal_prom
from RH.dbo.departamento d
join v1 on d.iddepartamento = v1.iddepartamento;



/*
Desarrolle una sentencia SELECT para encontrar 
los departamentos que tienen más de 5 trabajadores. 
Base de datos RH.
*/

select iddepartamento, count(1) cant_emp
from RH.dbo.empleado
group by iddepartamento
having count(1) > 5;

/*   
Cambio: Agregar el nombre del departamento
*/




/*
Desarrolle una sentencia SELECT para encontrar 
el importe recaudado por curso. 
Base de datos EDUCA.

---------------------------------------------
codigo    nombre           importe
curso     curso            recaudado
---------------------------------------------
aaa       aaaaaaaaa        ####.##
bbb       bbbbbbbbb        ####.##
---------------------------------------------
*/

select * from educa.dbo.matricula;
select * from educa.dbo.pago;


/*
Desarrolle una sentencia SELECT para encontrar 
la cantidad de alumnos matriculados
y el importe recaudado por curso. 
Base de datos EDUCA.

------------------------------------------------------
codigo    nombre           alumnos        importe
curso     curso            matriculados   recaudado
------------------------------------------------------
aaa       aaaaaaaaa        ###            ####.##
bbb       bbbbbbbbb        ###            ####.##
------------------------------------------------------

*/





-- aporte del profe

SELECT * FROM EDUCA.DBO.CURSO;


select 
	A.cur_id, A.cur_nombre , A.cur_matriculados Alumnos_Matriculados, 
	ISNULL(SUM(B.pag_importe), 0) Importe_Recaudado
from [EDUCA].[dbo].[CURSO] A
LEFT JOIN [EDUCA].[dbo].[PAGO] B
ON A.cur_id = B.cur_id
WHERE A.cur_matriculados > 0
group by A.cur_id, A.cur_nombre, A.cur_matriculados;




-- 1
select matriculaemp, nomeemp from tab_empregados where deptoemp = 10

-- 2
select emp.matriculaemp, emp.nomeemp 
from tab_empregados emp 
inner join tab_departamentos dep on emp.deptoemp = dep.codigodepto
where dep.nomedepto = 'Tecnologia da Informação' and emp.salarioemp < 1000

-- 3
select proj.nomeproj from tab_projetos proj
inner join tab_horasalocadas h on proj.numeroproj = h.projeto
inner join tab_empregados emp on emp.matriculaemp = h.empregado
where emp.nomeemp = 'João da Silva Vieira' and h.horas > 30

-- 4
select emp.nomeemp from tab_empregados emp
left join tab_dependentes depe on emp.matriculaemp = depe.matriculaemp
where depe.matriculaemp is null

-- 5
select distinct emp.nomeemp from tab_empregados emp
inner join tab_departamentos dep on emp.matriculaemp = dep.gerentedepto
inner join tab_dependentes depe on emp.matriculaemp = depe.matriculaemp

-- 6
SELECT e.matriculaEmp, e.nomeEmp
FROM Tab_Empregados e
JOIN Tab_HorasAlocadas h ON e.matriculaEmp = h.empregado
UNION
SELECT e.matriculaEmp, e.nomeEmp
FROM Tab_Empregados e
JOIN Tab_Departamentos d ON e.matriculaEmp = d.gerenteDepto
JOIN Tab_Projetos p ON d.codigoDepto = p.deptoProj;

-- 7
select dep.codigodepto, avg(emp.salarioemp) as salariomedio
from tab_empregados emp
join tab_departamentos dep on emp.deptoemp = dep.codigodepto
group by dep.codigodepto
having avg(emp.salarioemp) > 1000.00;

-- 8
select emp.matriculaemp, count(*) as qtd_projetos
from tab_empregados emp
join tab_horasalocadas h on emp.matriculaemp = h.empregado
join tab_projetos proj on h.projeto = proj.numeroproj
join tab_departamentos dep on emp.deptoemp = dep.codigodepto
where dep.nomedepto = 'tecnologia da informação'
group by emp.matriculaemp
having count(*) > 2;


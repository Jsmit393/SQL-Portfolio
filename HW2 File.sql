 
 -- 1
 select fname,lname

from employee

where fname like 'A%' and lname like 'J%';

-- 2

select e.fname,e.lname,e.salary

from employee e inner join department d

on e.dno = d.dnumber

where d.dname = 'Hardware';

-- 3
 select fname,lname,salary

from employee

where ssn = ( select w.essn

from works_on w inner join project p on w.pno = p.pnumber

where p.pname = 'ProductX') ;

-- 4

SELECT
SUM(salary) * 0.05 AS total401k
FROM
employee;

-- 5

SELECT
SUM(hours)
FROM
works_on
INNER JOIN
project
ON works_on.pno = project.pnumber
WHERE
project.pname = 'ProductX';

-- 6

SELECT
fname,
lname,
dname,
salary
FROM
employee
INNER JOIN
department
ON employee.dno = department.dnumber
WHERE
sex = 'F'
AND salary =
(
SELECT
MAX(salary)
FROM
employee
WHERE
sex = 'F'
);
-- a)
SELECT dependent.dependent_name, employee.fname FROM dependent INNER JOIN employee ON dependent.essn = employee.ssn WHERE employee.fname LIKE 'R%';
SELECT dependent.dependent_name, employee.fname FROM dependent INNER JOIN employee ON dependent.essn = employee.ssn WHERE dependent.dependent_name LIKE 'R%';
-- b)
SELECT COUNT(essn) FROM works_on WHERE pnum=1;
-- c)
SELECT COUNT(ssn) FROM employee WHERE salary > 3500000;
-- d)
SELECT employee.ssn, works_on.pnum FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn WHERE employee.dnum=2;
SELECT COUNT(DISTINCT(works_on.pnum)) FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn WHERE employee.dnum=2;
-- e)
SELECT dnum, AVG(salary), SUM(salary) FROM employee GROUP BY dnum;
-- f)
SELECT dnum, COUNT(ssn) FROM employee GROUP BY dnum ORDER BY COUNT(ssn) DESC;
-- g)
SELECT pnum, SUM(hours) FROM works_on GROUP BY pnum;
-- h)
SELECT employee.fname, SUM(works_on.hours) as total FROM employee INNER JOIN works_on ON employee.ssn=works_on.essn GROUP BY employee.ssn HAVING SUM(works_on.hours) > 140 ORDER BY total DESC;
-- i)
SELECT employee.fname, SUM(works_on.hours) as total, 
    CASE 
        WHEN SUM(works_on.hours) > 200 THEN salary*0.5
        WHEN SUM(works_on.hours) > 150 THEN salary*0.25
        ELSE salary*0.1
    END AS bonus
    FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn GROUP BY employee.ssn;
-- j)
SELECT employee.fname, COUNT(works_on.pnum) as banyak FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn GROUP BY employee.ssn ORDER BY banyak DESC; 
-- k)
SELECT employee.fname, COUNT(works_on.pnum) as banyak FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn GROUP BY employee.ssn HAVING COUNT(works_on.pnum)=4; 
-- l)
SELECT employee.fname, AVG(works_on.hours) as total, COUNT(works_on.pnum) as banyak FROM employee LEFT JOIN works_on ON employee.ssn=works_on.essn GROUP BY employee.ssn HAVING AVG(works_on.hours) = 70 AND COUNT(works_on.pnum) = 2;
-- m)
SELECT employee.fname, COUNT(dep.dependent_name) FROM employee LEFT JOIN dependent dep ON employee.ssn=dep.essn GROUP BY employee.ssn;
-- n)
SELECT employee.fname, NOW() - mgrstartdate as lama FROM department LEFT JOIN employee ON department.mgrssn=employee.ssn;
-- o)
SELECT dlocation, COUNT(dnum) FROM dept_locations GROUP BY dlocation HAVING COUNT(dnum) > 1;

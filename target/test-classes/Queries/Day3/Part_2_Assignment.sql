--1. Display full addresses from locations table in a single column
SELECT STREET_ADDRESS||' '||CITY||', '||STATE_PROVINCE||' '|| POSTAL_CODE
AS FULL_ADDRESS
FROM LOCATIONS;

--2. Display all informations of the employee who has the minimum salary in employees table
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

--3. Display the second minimum salary from the employees
SELECT MIN(SALARY) FROM EMPLOYEES
                WHERE SALARY NOT IN ( SELECT MIN(SALARY) FROM EMPLOYEES);

--4. Display all informations of the employee who has the second minimum salary
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES
                WHERE SALARY NOT IN ( SELECT MIN(SALARY) FROM EMPLOYEES));

--5. List all the employees who are making above the average salary;
SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

--6. List all the employees who are making less than the average salary
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

--7. Display manager name of 'Neena'
SELECT JOB_TITLE FROM JOBS
WHERE JOB_ID = (SELECT JOB_ID from EMPLOYEES
                WHERE EMPLOYEES.FIRST_NAME LIKE '%Neena%');

--8. Find the 3rd maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY DESC)
                         WHERE ROWNUM <4); --14000
--9. Find the 5th maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY DESC)
                         WHERE ROWNUM <6); --13000

--10. Find the 7th maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY DESC)
                         WHERE ROWNUM <8); --12000

--11. Find the 10th maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY DESC)
                         WHERE ROWNUM <11); --10500

--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
SELECT MAX(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY ASC)
                         WHERE ROWNUM <4); --2400

--13. Find the 5th minimum salary from the employees table (do not include duplicates)
SELECT MAX(SALARY) FROM (SELECT SALARY FROM (SELECT DISTINCT SALARY from EMPLOYEES
                                             ORDER BY SALARY ASC)
                         WHERE ROWNUM <6); --2600

--1 List all the employees first and last name with their salary in employees table
SELECT FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES;

--2 How many employees have salary less than 5000?
SELECT count(*) from EMPLOYEES
WHERE SALARY <5000;

--3. How many employees have salary between 6000 and 7000?
SELECT count(*) from EMPLOYEES
WHERE SALARY BETWEEN 6000 and 7000;

--3 ALternate
SELECT count(*) from EMPLOYEES
WHERE SALARY >= 6000 and SALARY <= 7000;

--4. List all the different region_ids in countries table
SELECT DISTINCT REGION_ID from COUNTRIES;

--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
SELECT FIRST_NAME||' '||LAST_NAME as Full_Name, SALARY
from EMPLOYEES
WHERE FIRST_NAME='Douglas' and LAST_NAME='Grant';

--6 Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
SELECT * from DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('IT', 'Public Relations', 'Sales', 'Executive'); --Used ChatGPT for IN function

--7. Display the maximum salary in employees table
SELECT MAX(SALARY) from EMPLOYEES;

--7 Alt
SELECT * from EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) from EMPLOYEES); --USed ChatGPT

--8. Display the minimum salary in employees table
SELECT MIN(SALARY) from EMPLOYEES;

--8 Alt
SELECT * from EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) from EMPLOYEES); --USed ChatGPT

--9. Display the average salary of the employees
SELECT ROUND(AVG(SALARY), 2) from EMPLOYEES;

--10. Count the total numbers of the departments in departs table
SELECT COUNT(*) from DEPARTMENTS;

--11. Sort the start_date in ascending order in job_history's table
SELECT START_DATE from JOB_HISTORY
ORDER BY START_DATE ASC;

--12. Sort the start_date in descending order in job_history's table
SELECT START_DATE from JOB_HISTORY
ORDER BY START_DATE DESC;

--13. Display all records whose last name contains 2 lowercase 'a's
SELECT * from EMPLOYEES
WHERE LAST_NAME LIKE '%a%a%';

--14. Display all the employees whose first name starts with ‘A'
SELECT * from EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';

--15. Display all the employees whose job_ID contains ‘IT'
SELECT * from EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

--16. Display all unique job_id that end with CLERK in employee table
SELECT DISTINCT JOB_ID from EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';

--17.Display all employees first name starts with A and have exactly 4 characters
SELECT * from EMPLOYEES
WHERE FIRST_NAME LIKE 'A___';

--18. Display all the employees whose department id in 50, 80, 100
SELECT * from EMPLOYEES
WHERE DEPARTMENT_ID IN (50, 80, 100);

--19. Display all employees who does not work in any one of these department id —
--> 90, 60, 100, 130, 120
SELECT * from EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120);

--20. divide employees into groups by using their job id
-- 1 display the maximum salaries in each groups
-- 2 display the minimum salaries in each groups
-- 3 display the average salary of each group
-- 4 how many employees are there in each group that have minimum salary of 5000 ?
-- 5 display the total budgets of each groups
SELECT MAX(SALARY), MIN(SALARY), AVG(SALARY),
       COUNT(CASE WHEN salary >= 5000  THEN 1 END) as NUM_EMPLOYEES_SALARY_OVER_5000, --From Chat GPT
       SUM(SALARY) as TOTAL_BUDGET
FROM EMPLOYEES
GROUP BY JOB_ID;

--Individual:
--      1)
SELECT JOB_ID, MAX(SALARY) as MAX_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;

--      2)
SELECT JOB_ID, MIN(SALARY) as MIN_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;

--      3)
SELECT JOB_ID, AVG(SALARY) as AVG_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;

--      4)
SELECT JOB_ID, COUNT(SALARY) as OVER_5000
FROM EMPLOYEES
WHERE SALARY>=5000
GROUP BY JOB_ID;

--      5)
SELECT JOB_ID, SUM(SALARY) as TOTAL_BUDGET
FROM EMPLOYEES
GROUP BY JOB_ID;

--21. display all job_id and average salary who work as any of these jobs
--IT_PROG,SA_REP, FI_ACCOUNT, AD_VP
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
GROUP BY JOB_ID;

--22.Display max salary for each department
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --Used ChatGpt because I forgot to put "IS" LOL
GROUP BY DEPARTMENT_ID;

--23. Display total salary for each department except department_id 50
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID != '50'
GROUP BY DEPARTMENT_ID;


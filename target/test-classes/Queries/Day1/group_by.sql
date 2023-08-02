Select distinct JOB_ID from EMPLOYEES;

SELECT avg(SALARY) from EMPLOYEES
where JOB_ID='IT_PROG';

Select JOB_ID, AVG(SALARY)
from EMPLOYEES
GROUP BY JOB_ID;

SELECT LOCATION_ID, COUNT(DEPARTMENT_NAME) from DEPARTMENTS
GROUP BY LOCATION_ID;

SELECT LOCATION_ID, COUNT(DEPARTMENT_NAME) from DEPARTMENTS
GROUP BY LOCATION_ID
Order by 2 ASC;

SELECT count(COUNTRY_ID), REGION_ID from COUNTRIES
group by REGION_ID
order by 1 asc;

SELECT DEPARTMENT_ID, SUM(SALARY) from EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT JOB_ID, ROUND(AVG(SALARY),2) from EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 5000;

SELECT FIRST_NAME, COUNT(*) from EMPLOYEES
group by FIRST_NAME
Having COUNT(FIRST_NAME) >1;

Select FIRST_NAME from EMPLOYEES
ORDER BY FIRST_NAME ASC;

--display dept id where employee count is bigger than 5
SELECT DEPARTMENT_ID, count(*) from EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>5;

SELECT FIRST_NAME || ' ' || LAST_NAME as Full_Name
from EMPLOYEES;


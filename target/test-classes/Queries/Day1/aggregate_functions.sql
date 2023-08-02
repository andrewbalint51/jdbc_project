Select count(*) from EMPLOYEES;

SELECT count(distinct FIRST_NAME)
from EMPLOYEES;

SELECT count(*) from EMPLOYEES
Where JOB_ID IN('IT_PROG', 'SA_REP');
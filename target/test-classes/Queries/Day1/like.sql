select * from COUNTRIES
where COUNTRY_NAME like 'A%';

select * from COUNTRIES
where COUNTRY_NAME like '%a';

select * from COUNTRIES
where COUNTRY_NAME like 'A%a';
--  and COUNTRY_NAME like '%a';

select * from COUNTRIES
where COUNTRY_NAME like '____a%';

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'Jen%';

Select * from EMPLOYEES
where FIRST_NAME like 'H%l'

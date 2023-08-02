CREATE TABLE scrumteam(
    emp_id INTEGER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    job_title VARCHAR(20),
    salary INTEGER
);

SELECT * from scrumteam;

INSERT INTO scrumteam(emp_id, first_name, last_name, job_title, salary)
VALUES (1, 'Harry', 'Potter', 'Wizard', 100000);

INSERT INTO scrumteam(emp_id, first_name, last_name, job_title, salary)
VALUES (2, 'Han', 'Solo', 'Pilot', 120000);

commit;

--CRUD
--Create (INSERT)
--Read (SELECT)
--Update (UPDATE)
--Delete (DELETE)


--Alter
--Add new column
ALTER TABLE SCRUMTEAM ADD gender varchar(2);

UPDATE SCRUMTEAM
SET gender ='M';

commit;

SELECT * from SCRUMTEAM;

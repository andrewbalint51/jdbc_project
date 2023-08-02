CREATE TABLE SALESPEOPLE(
                          sp_id INTEGER PRIMARY KEY,
                          sp_name VARCHAR(30) NOT NULL
);

CREATE TABLE COMPANY(
                            company_id INTEGER PRIMARY KEY,
                            company_name VARCHAR(30) NOT NULL
);

CREATE TABLE SALES(
                        sale_id INTEGER PRIMARY KEY,
                        Amount Integer NOT NULL,
                        sp_id Integer NOT NULL,
                        company_id Integer NOT NULL

);


INSERT INTO COMPANY(company_id, company_name)
VALUES (1, 'IBM');

INSERT INTO COMPANY(company_id, company_name)
VALUES (2, 'Google');

INSERT INTO COMPANY(company_id, company_name)
VALUES (3, 'Walmart');

INSERT INTO SALES(sale_id, Amount, sp_id, company_id)
VALUES (1, 1000000, 1, 3);

INSERT INTO SALES(sale_id, Amount, sp_id, company_id)
VALUES (2, 1300000, 2, 2);

INSERT INTO SALES(sale_id, Amount, sp_id, company_id)
VALUES (3, 15600000, 3, 1);
INSERT INTO SALES(sale_id, Amount, sp_id, company_id)
VALUES (4, 16600, 2, 3);
INSERT INTO SALES(sale_id, Amount, sp_id, company_id)
VALUES (5, 145000, 1, 2);

SELECT * From COMPANY;

INSERT INTO SALESPEOPLE(sp_id, sp_name)
VALUES (1, 'Harry Potter');

INSERT INTO SALESPEOPLE(sp_id, sp_name)
VALUES (2, 'Lukas Perth');

INSERT INTO SALESPEOPLE(sp_id, sp_name)
VALUES (3, 'SMerth Slamerth');

commit;


SELECT * from SALESPEOPLE;

--ASSIGNMENT START

--1. Display sales people names ending in "th"
SELECT sp_name from SALESPEOPLE
Where sp_name LIKE '%th';

--2. Display company names for company ids 21, 32, 412, 43, 25
SELECT COMPANY_NAME from COMPANY
Where company_id in(21, 32, 412, 43, 25);

--3. How many sales people do we have in total?
SELECT count(*) from SALESPEOPLE;

--4. Display the name of the sales person who made a sale to the company name Walmart
SELECT sp_name from SALESPEOPLE
JOIN SALES S on SALESPEOPLE.sp_id = S.sp_id join COMPANY C2 on S.company_id = C2.company_id
where company_name = 'Walmart';

--5 Display the average Sales amount for each sp_id
SELECT sp_id, avg(Amount) FROM SALES
GROUP BY sp_id;
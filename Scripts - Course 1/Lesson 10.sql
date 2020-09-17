-- Developed by Guilherme Costa

/*1*/

CREATE TABLE my_employee(
ID NUMBER(4) NOT NULL PRIMARY KEY,
LAST_NAME VARCHAR(25),
FIRST_NAME VARCHAR(25),
USERID VARCHAR2(8),
SALARY NUMBER(9,2)
);

/*2*/

DESC my_employee;

/*3*/

INSERT INTO my_employee VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

/*4*/

INSERT INTO my_employee (ID, LAST_NAME, FIRST_NAME, USERID, SALARY) VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

/*5*/

SELECT * 
FROM my_employee;

/*6 AND 7*/

INSERT INTO my_employee (ID, LAST_NAME, FIRST_NAME, USERID, SALARY) VALUES (&ID, '&LAST_NAME', '&FIRST_NAME', '&USER_ID', &SALARY);

/*8*/

SELECT *
FROM my_employee;

/*9*/

COMMIT;

/*10*/

UPDATE my_employee
SET LAST_NAME = 'Drexler' 
WHERE ID = 3;

/*11*/

UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

/*12*/

SELECT *
FROM my_employee;

/*13*/

DELETE FROM my_employee
WHERE last_name LIKE INITCAP('Dancs') AND first_name LIKE INITCAP('Betty');

/*14*/

SELECT *
FROM my_employee;

/*15*/

COMMIT;

/*16 AND 17*/

SELECT * 
FROM my_employee;

/*18*/

SAVEPOINT step_17;

/*19*/

DELETE
FROM my_employee;

/*20*/

SELECT *
FROM my_employee;

/*21*/

ROLLBACK TO step_17;

/*22*/

SELECT *
FROM my_employee;

/*23*/

COMMIT;

/*24*/

INSERT INTO my_employee (ID, LAST_NAME, FIRST_NAME, USERID, SALARY) VALUES (&ID, '&&LAST_NAME', '&&FIRST_NAME', LOWER(SUBSTR('&LAST_NAME', 1, 1) || SUBSTR('&FIRST_NAME', 1, 7)) , &SALARY);

/*25*/

SELECT *
FROM my_employee;

-- Developed by Guilherme Costa

/*1*/

SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE job_id = 'ST_CLERK';

/*2*/

SELECT  country_id, country_name
FROM countries
MINUS 
SELECT l.country_id, c.country_name
FROM locations l JOIN countries c
ON (l.country_id = c.country_id)
JOIN departments d
ON d.location_id=l.location_id;

/*3*/

SELECT employee_id, job_id, department_id
FROM employees
WHERE department_id = 50
UNION ALL
SELECT employee_id, job_id, department_id
FROM employees 
WHERE department_id = 80;

/*4*/

SELECT employee_id
FROM employees
WHERE job_id='SA_REP'
INTERSECT
SELECT employee_id
FROM employees
WHERE department_id=80;

/*5*/

SELECT last_name,department_id,TO_CHAR(null)dept_name
FROM employees
UNION
SELECT TO_CHAR(null),department_id,department_name
FROM departments;

-- Developed by Guilherme Costa

/*Because of budget issues, the HR department needs a report that displays the last name
and salary of employees who earn more than $12,000.*/

SELECT last_name, salary
FROM employees
WHERE salary > 12000;

/*Open a new SQL Worksheet. Create a report that displays the last name and departmen number for
employee number 176. Run the query.*/

SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

/*The HR department needs to find high-salary and low-salary employees. Modify 
exercise 1 to display the last name and salary for any employee whose salary is not
in the range $5.000 through $12.000.*/

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

/*Create a report to display the last name, job ID, and hire date for employees with the last
names of Matos and Taylor. Order the query in ascending order by hire date.*/

SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name like 'Matos'
OR last_name like 'Taylor'
ORDER BY hire_date;

/*Display the last name and department ID of all employees in departments 20 or 50 in
ascending alphabetical order by last_name.*/

SELECT last_name, department_id
FROM employees
WHERE department_id = 20 
OR department_id = 50
ORDER BY last_name;

/*Modify exercise 3 to display the last name and salary of employees who earn
between $5.000 and $12.000, and are in department 20 or 50. Label the columns
Employee and Monthly Salary, respetively.*/

SELECT last_name "Employee", salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id IN (20, 50);

/*The HR department needs a report that displays the last name and hire date of all
employees who were hired in 2006.*/

SELECT last_name, hire_date 
FROM employees
WHERE hire_date >= '01-JAN-06' AND hire_date < '01-JAN-07';

/*Create a report to display the last name and job title of all employees who do not have a
manager.*/

SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

/*Create a report to display the last name, salary, and commission of all employees who earn
commissions. Sort the data in descending order of salary and commissions.
Use the column’s numeric position in the ORDER BY clause.*/

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

/*Members of the HR department want to have more flexibility with the queries that you are
writing. They would like a report that displays the last name and salary of employees who
earn more than an amount that the user specifies after a prompt. */

SELECT last_name, salary
FROM employees
WHERE salary > &sal_ammount;

/*The HR department wants to run reports based on a manager. Create a query that prompts
the user for a manager ID, and generates the employee ID, last name, salary, and
department for that manager's emloyees. The HR department wants the ability to sort the
report on a selected column.*/

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id = &manager_id
ORDER BY &column;

/*Display the last names of all employees where the third letter of the name is “a.”*/

SELECT last_name
FROM employees
WHERE last_name like '__a%';

/*Display the last names of all employees who have both an “a” and an “e” in their last name.*/
SELECT last_name
FROM employees
WHERE last_name like '%a%' AND last_name like '%e%';

/*Display the last name, job, and salary for all employees whose jobs are either that of a
sales representative or a stock clerk, and whose salaries are not equal to $2,500, $3,500,
or $7,000.*/

SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP','ST_CLERK')
AND salary NOT IN(2500,3500,700);

/*Modify exercise 6 to to display the last name, salary, and commission for all employees
whose commission is 20%.*/

SELECT last_name "Employee", salary "Monthly Salary", commission_pct "Commission"
FROM employees
WHERE commission_pct = .20;

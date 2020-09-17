-- Developed by Guilherme Costa

/*Write a query to display the system date. Label the column Date.*/

SELECT sysdate "Date" 
FROM dual;

/*The HR department needs a report to display the employee number, last name, salary, and
salary increased by 15.5% (expressed as a whole number) for each employee.*/

SELECT employee_id, last_name, salary, ROUND(salary*1.155, 0) "New Salary"
FROM employees;

/*Modify your query in Exercise 2 to add a column that subtracts the old salary from
the new salary. Label the column Increase.*/

SELECT employee_id, last_name, salary, ROUND(salary*1.155, 0) "New Salary", ROUND(salary*1.155, 0) - salary "Increase"
FROM employees;

/*Write a query that displays the last name (with the first letter in uppercase and all the
other letters in lowercase) and the length of the last name for all employees whose
name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort
the results by the employees’ last names.*/

SELECT INITCAP(last_name) "Last Name", LENGTH(last_name) "Lenght last name"
FROM employees
WHERE last_name LIKE 'J%'
OR last_name LIKE 'A%'
OR last_name LIKE 'M%'
ORDER BY last_name;

/*Rewrite the query so that the user is prompted to enter the letter that the last name
starts with. For example, if the user enters “H” (capitalized) when prompted for a letter,
the output should show all employees whose last name starts with the letter “H.”*/

SELECT INITCAP(last_name) "Last Name", LENGTH(last_name) "Lenght last name"
FROM employees
WHERE last_name
LIKE UPPER('&letter%')
ORDER BY last_name;

/*The HR department wants to find the duration of employment for each employee. For
each employee, display the last name and calculate the number of months between
today and the date on which the employee was hired.Label the column as
MONTHS_WORKED. Order your results by the number of months employeed. The number
of months must be rounded to the closest whole number.*/

SELECT last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date), 0) "Months Worked"
FROM employees
ORDER BY "Months Worked";

/*Create a query to display the last name and salary for all employees. Format the salary
to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.*/

SELECT last_name, LPAD(salary, 15, '$') "Salary"
FROM employees;

/*Create a query that displays the employees’ last names, and indicates the amounts of
their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in
descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.*/

SELECT last_name, RPAD(' ', salary/1000, '*') "EMPLOYEES_AND_THEIR_SALARIES"
FROM employees
ORDER BY "EMPLOYEES_AND_THEIR_SALARIES" DESC;

/*Create a query to display the last name and the number of weeks employed for all
employees in department 90. Label the number of weeks column as TENURE. Truncate
the number of weeks value to 0 decimal places. Show the records in descending order
of the employee’s tenure.*/

SELECT last_name, TRUNC((SYSDATE-hire_date)/7) AS TENURE
FROM
employees
WHERE department_id = 90
ORDER BY TENURE DESC;
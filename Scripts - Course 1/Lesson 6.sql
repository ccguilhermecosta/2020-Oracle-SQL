-- Developed by Guilherme Costa

/*Find highest, lowest, sum and average salary  of all employees. Label the columns
Maximum, Minimum, Sum and Average, respectively. Roud your results to the
nearest whole number.*/

SELECT ROUND(MAX(salary)) "Maximum",
ROUND(MIN(salary)) "MINIMUM",
ROUND(SUM(salary)) "Sum",
ROUND(AVG(salary)) "Average"
FROM employees;

/*Modify the query in exercise 1 to display the minimum, maximum, sum and averae
salary for each job type.*/

SELECT job_id,
ROUND(MAX(salary)) "Maximum",
ROUND(MIN(salary)) "Minimum",
ROUND(SUM(salary)) "Sum",
ROUND(AVG(salary)) "Average"
FROM employees
GROUP BY job_id;

/*Write a query to display the number of people with the same job.*/

SELECT job_id, COUNT(*)
FROM employees
WHERE job_id = UPPER('&job_id')
GROUP BY job_id;

/*Determine the number of managers without listing them. Label the column Number of
Managers*/

SELECT COUNT(DISTINCT manager_id)
FROM employees;

/*Find the difference between the highest and lowest salaries.Label the column
DIFFERENCE*/

SELECT MAX(salary) - MIN(salary) "Difference"
FROM employees;

/*Create a report to display the manager number and the salary of the lowest-paid
employee for that manager. Exclude anyone whose manager is not known. Exclude
any groups where the minimum salary is $6,000 or less. Sort the output in descending
order of salary.*/

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

/*Create a matrix query to display the job, the salary for that job based on the department
number, and the total salary for that job, for departments 20, 50, 80, and 90, giving each
column an appropriate heading.*/

SELECT job_id "Job",
        SUM(DECODE(department_id, 20, salary)) "Dept 20",
        SUM(DECODE(department_id, 50, salary)) "Dept 50",
        SUM(DECODE(department_id, 80, salary)) "Dept 80",
        SUM(DECODE(department_id, 90, salary)) "Dept 90",
        SUM(salary) "Total"
FROM employees
GROUP BY job_id;


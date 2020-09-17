-- Developed by Guilherme Costa

/*Create a report that produces the following for each employee:
<employee last name> earns <salary> monthly but wants <3 times salary.>.
Label the column Dream Salaries.*/

SELECT last_name || ' earns ' || TO_CHAR(salary, 'fm$99,999.00') || ' monthly but wants ' || TO_CHAR(salary*3, 'fm$99,999.00')
FROM employees;

/*Display each employee’s last name, hire date, and salary review date, which is the first
Monday after six months of service. Label the column REVIEW. Format the dates to
appear in a format that is similar to “Monday, the Thirty-First of July, 2000.”*/

SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'SEGUNDA-FEIRA'), 
'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
FROM employees;

/*Create a query that displays employees’ last names and commission amounts. If an
employee does not earn commission, show “No Commission.” Label the column COMM.*/

SELECT last_name, NVL(TO_CHAR(commission_pct), 'No commission') "COMM"
FROM employees;

/*Using the CASE function, write a query that displays the grade of all employees based on
the value of the JOB_ID column, using the following data:*/

SELECT job_id, CASE job_id
            WHEN 'ST_CLERK' THEN 'E'
            WHEN 'SA_REP' THEN 'D'
            WHEN 'IT_PROG' THEN 'C'
            WHEN 'ST_MAN' THEN 'B'
            WHEN 'AD_PRES' THEN 'A'
            ELSE '0' END GRADE
FROM employees;

/*Rewrite the statement in the preceding exercise by using the searched CASE syntax.*/

SELECT last_name,
  (CASE WHEN job_id LIKE 'AD_PRES' THEN 'A'
        WHEN job_id LIKE 'ST_MAN' THEN 'B'
        WHEN job_id LIKE 'IT_PROG' THEN 'C'
        WHEN job_id LIKE 'SA_REP' THEN 'D'
        WHEN job_id LIKE 'ST_CLERK' THEN 'E'
        ELSE '0'
    END) "GRADE"
FROM employees;

/*Rewrite the statement in the preceding exercise by using the searched DECODE syntax.*/

SELECT job_id,
    DECODE(job_id, 'AD_PRES', 'A',
                    'ST_MAN', 'B',
                    'IT_PROG', 'C',
                    'SA_REP', 'D',
                    'ST_CLERK', 'E',
                                '0'
                    
            ) "Grade"
FROM employees;
                    
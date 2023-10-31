#Exercise #1:

#Create a query that upon execution returns a result set containing the employee numbers, contract salary values, 
#start, and end dates of the first ever contracts that each employee signed for the company.

SELECT 
    s.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MIN(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
        AND s.from_date = s1.from_date;

#or

SELECT 
    s.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MIN(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
WHERE
    s.from_date = s1.from_date;
    
    
#create querry that will extract following infrmtn about all current employed workers registered 
#in dept_emp table

#their employee number
#department they are working in 
#the salary they are currently being paid(i.e salary value specifed in their latest contract
#all time average salary  paid in the department the employee is curently working in (usewindow function
#to create a field named average_salary_per_department)

SELECT 
    dept2.emp_no, d.dept_name , avg(salary) over w as 'Avg_dept_salary'
FROM
    (SELECT 
        dept.emp_no, dept.dept_no, dept.from_date, dept.to_date
    FROM
        dept_emp dept
    JOIN (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) dept1 ON dept.emp_no = dept1.emp_no
    WHERE
        dept.to_date > SYSDATE()
            AND dept.from_date = dept1.from_date ) dept2
        JOIN
    (SELECT 
        s.emp_no, s.salary, s.from_date, s.to_date
    FROM
        salaries s
    JOIN (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
    WHERE
        s.to_date>sysdate() and s.from_date = s1.from_date)  s2 ON dept2.emp_no = s2.emp_no
        JOIN
        departments d on dept2.dept_no=d.dept_no
        window w as (partition by dept2.dept_no)
        order by dept2.dept_no;
        


# Exercise #1:

#Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated 
#before the 1st of January 2002 (as registered in the "dept_emp" table).

#Create a MySQL query that will extract the following information about these employees:

#Their employee number

#The salary values of the latest contracts they have signed during the suggested time period

#The department they have been working in (as specified in the latest contract they've signed 
#during the suggested time period)

#Use a window function to create a fourth field containing the average salary paid in the department 
#the employee was last working in during the suggested time period. Name that field 
#"average_salary_per_department".


 
 SELECT

    de2.emp_no, de2.from_date,d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department

FROM

    (SELECT

    de.emp_no, de.dept_no, de.from_date, de.to_date

FROM

    dept_emp de

        JOIN

(SELECT

emp_no, MAX(from_date) AS from_date

FROM

dept_emp

GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no

WHERE

    de.to_date < '2002-01-01'

AND de.from_date > '2000-01-01'

AND de.from_date = de1.from_date) de2

JOIN

    (SELECT

    s1.emp_no, s.salary, s.from_date, s.to_date

FROM

    salaries s

    JOIN

    (SELECT

emp_no, MAX(from_date) AS from_date

FROM

salaries

    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no

WHERE

    s.to_date < '2002-01-01'

AND s.from_date > '2000-01-01'

AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no

JOIN

    departments d ON d.dept_no = de2.dept_no

GROUP BY de2.emp_no, d.dept_name

WINDOW w AS (PARTITION BY de2.dept_no)

ORDER BY de2.emp_no, salary;
select * from dept_emp where emp_no=45381;
use employees;
SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;

SELECT 
    dept_no
FROM
    departments;
    
select * from departments;
use sales;

select * from test;

select * from departments;

use employees;
## Where operator

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';

# And operator
use employees ;
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
# OR operator
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR  first_name = 'Elvis';
    
select * from employees where first_name='Denis';

select * from employees where first_name='Elvis';

select* from employees where first_name='Denis' or first_name='Elvis';

select * from employees where first_name='Kellie' or first_name='Aruna';

# sql while running querry 'And' operator is always apllied first then 'or' operator is executedregardless of order in which you  use them
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M' OR gender = 'F';
    
#This return 1000 rows which is impossible because it first runs Denis and gender ='M' then sperately treats gender='F' so use ()

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Aruna' OR 'Kellie');

# IN , NOT IN

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvin');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Jacob' , 'John', 'Mark');
 
 
#Like and notlike with % and _

SELECT 
    *
FROM
    employees
WHERE
    first_name like ('mar%');

#One character _
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');

select * from employees where first_name like ('%ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('_ar_');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mhire_dateark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
select * from employees where emp_no between 10000 and 10009;

    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
  
  

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    
#Between and not between 

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01' order by hire_date ;   #endpoints and first point included
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01' order by hire_date;
    
    
    SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
    SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
    SELECT 
    dept_name , dept_no
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
    SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NULL;
    
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL
;


SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND hire_date >= '2000-01-01';
    
select * from salaries where salary > 150000;

select gender from employees;

select distinct gender from employees ;

select distinct hire_date from employees;

#Count

select count(emp_no) from employees;

select * from employees where first_name is null;
#above can also be writen as
select count(first_name) from employees where first_name is not null;

#now check no of rows if both are equal then no null

#counting no of distinct name
select count(distinct first_name) from employees;


select count(salary) from salaries where salary >= 100000;

select count(*) from dept_manager ;

#ORDER BY
SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

#when we ordered first name many had common first name so we also use second name to order them

select * from employees order by first_name desc ,last_name asc;

#hire date in descndng
select * from employees order by hire_date desc;

#Groupby (note compare output of each querry)
select first_name from employees group by first_name; #even this returs distinbct values

select distinct first_name from employees;
select distinct first_name from employees order by first_name;

select count(first_name) from employees ;
select count(first_name) from employees group by first_name;
select first_name ,count(first_name) from employees group by first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    first_name,COUNT(first_name)
FROM
    employees
WHERE
    gender = 'M'
GROUP BY first_name
ORDER BY first_name DESC;

#As alias in previous querry out put scnd clmn named as COUNT(first_name) name of querry is assigned 
#but if you want to ranme column as u wish add name with as in querry as given below

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name;  #now observe the second column name 


SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary order by salary; 

#Having  its often used with groupby
# you cant palce aggregates such as count with where so one uses having (even though both has same function)
SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name;   #This throws error so now place having after groupby 

SELECT 
    first_name, COUNT(first_name) as name_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250;

SELECT 
    salaries.*,AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

#Using having and where

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    hire_date < '1990-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200; 
 
 #Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
 SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
order by emp_no;

select * from dept_emp limit 10;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    hire_date < '2000-01-01'
GROUP BY (first_name)
HAVING COUNT(first_name)< 200
ORDER BY first_name DESC
LIMIT 10;

#How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no) as no_of_departments
FROM
    dept_emp;
    
#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
#1. Which is the lowest employee number in the database?
SELECT 
    min(emp_no)
from employees;
#2. Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;

#What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

#Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to 
#a precision of cents.

SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
  
  
SELECT 
    emp_no, first_name, last_name
FROM
    employees
WHERE
    emp_no = (SELECT 
            MIN(emp_no)
        FROM
            employees);

SELECT 
    emp_no, first_name
FROM
    employees
WHERE
    emp_no IN (SELECT 
            MIN(emp_no)
        FROM
            employees);

#adding duplicates
Insert into departments_dup values('d009','Customer Service');
insert into dept_manager_dup values('110228','d003','1992-03-21','9999-01-01');

#Joining
SELECT 
    m.emp_no, max(m.dept_no) as dept_no, max(d.dept_name) as dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.emp_no;

#deleting duplicates
DELETE FROM dept_manager_dup
WHERE
    emp_no ='110228';
    
DELETE FROM departments_dup  
WHERE 
    dept_no = 'd009';


SELECT 
    m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

insert into dept_manager_dup values ('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup values ('d009','Customer Service');

#left join
SELECT 
   m.dept_no, m.emp_no, d.dept_name 
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

#in left join order matters variable in select functionm must be added carefully
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no;
    
SELECT 
   m.dept_no, m.emp_no, d.dept_name 
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON d.dept_no = m.dept_no
where d.dept_name is Null
ORDER BY m.dept_no;


#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is 
#Markovitch. See if the output contains a manager with that name.  

#Hint : Create an output containing information corresponding to the following fields: 
#emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.dept_no
WHERE
    last_name = 'Markovitch'
ORDER BY d.dept_no desc,e.emp_no;

use sales;
insert into test values (1001,1),(1002,2),(1003,3);
select * from test order by numbers desc ,words asc; 
#here since values in numbers are unique words will not be used for sorting
#if there are multiple matching values in numbers then words asc will be excuted

use employees;

SELECT 
   m.dept_no, m.emp_no, d.dept_name 
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no=d.dept_no
ORDER BY m.dept_no;

SELECT 
   d.dept_no, m.emp_no, d.dept_name 
FROM
    dept_manager_dup m
        Right JOIN
    departments_dup d ON m.dept_no=d.dept_no
ORDER BY m.dept_no;
select * from dept_manager_dup where emp_no='999904';

#Extract a list containing information about all managers’ employee number, first and last name, 
#department number, and hire date. Use the old type of join syntax to obtain the result.

SELECT 
    m.dept_no,
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    e.hire_date
FROM
    employees e,
    dept_manager m
WHERE
    m.emp_no = e.emp_no
ORDER BY m.dept_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

#Select the first and last name, the hire date, and the job title of all employees 
#whose first name is “Margareta” and have the last name “Markovitch”.

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

#Cross join

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d order by dm.emp_no,d.dept_no ;
    
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d ON dm.dept_no <> d.dept_no order by dm.emp_no,d.dept_no;
    
#inner join can be done using just where which we have tried earlier now same emthod for cross but ignore where

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
WHERE
    dm.dept_no = d.dept_no;
    
select dm.* , d.* from departments d , dept_manager dm ;

SELECT 
    dm.*, d.*
FROM
    departments d,
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d join
    dept_manager dm ;


#Use a CROSS JOIN to return a list with all possible combinations between managers from 
#the dept_manager table and department number 9.

    
SELECT

    dm.*, d.*

FROM

    departments d

        CROSS JOIN

    dept_manager dm

WHERE

    d.dept_no = 'd009'

ORDER BY d.dept_name;

#Return a list with the first 10 employees with all the departments they can be 
#assigned to.

#Hint: Don’t use LIMIT; use a WHERE clause.

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    emp_no <= '10010' order by e.emp_no,d.dept_name;


#Using agregates with join
SELECT 
    e.gender, AVG(s.salary)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
group by e.gender;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON d.dept_no = dm.dept_no;

#Joining more than two tables
#Select all managers’ first and last name, hire date, job title, start date, 
#and department name.
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    titles t ON t.emp_no = dm.emp_no
        JOIN
    departments d ON d.dept_no=dm.dept_no
where t.title="Manager"
ORDER BY dm.emp_no;


SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    titles t ON t.emp_no = dm.emp_no
        JOIN
    departments d ON d.dept_no=dm.dept_no
where dm.from_date=t.from_date
ORDER BY dm.emp_no;

SELECT 
    dm.dept_no, AVG(salary) AS average_salary
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
group by dm.dept_no
HAVING average_salary>"60000"
order by average_salary DESC;

#How many male and how many female managers do we have in the ‘employees’ database?
SELECT 
    e.gender, COUNT(e.gender)
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
GROUP BY e.gender;


drop table if exists employees_dup;

CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

Insert into employees_dup select * from employees Limit 20;


SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no desc;


#Subquerry

SELECT 
    e.emp_no, e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

SELECT 
    e.first_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
#Extract the information about all department managers who were hired between the 
#1st of January 1990 and the 1st of January 1995.
SELECT 
    *
FROM
    dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.hire_date between '1990-01-01'
                AND '1995-01-01');
                
#Using exists

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
            
            

#Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT 
    *
FROM
    employees
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles
        WHERE
            titles.title = 'Assistant Engineer'
                AND titles.emp_no = employees.emp_no);


#Assign employee number 110022 as a manager to all employees from 10001 to 10020,and employee number110039
# as a manager to all employees from 10021 to 10040.

use employees;
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emply_id,
            min(d.dept_no) AS dept_id,
            (SELECT 
                    dept_manager.emp_no
                FROM
                    dept_manager
                WHERE
                    dept_manager.emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION (SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emply_id,
            min(d.dept_no) AS dept_id,
            (SELECT 
                    dept_manager.emp_no AS manager_id
                FROM
                    dept_manager
                WHERE
                    dept_manager.emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no > 10022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B) limit 1000;
    
    
    DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);

use employees;

#Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

#Your query skeleton must be:

#Insert INTO emp_manager SELECT

#U.*

#FROM

 #                (A)

# UNION (B) UNION (C) UNION (D) AS U;

#A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

#Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

#Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

#Your output must contain 42 rows.


INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;


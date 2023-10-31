use employees;

# returns gender as Male if its M else As Female
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;

#same code but slight change in case  statement
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS Gender
FROM
    employees
LIMIT 100;

# case with is not nul

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN d.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS 'role'
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
    where e.emp_no>109990;
    
#using if condtion

SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;
    
#department manager details and salary diference and other stuff

SELECT 
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_diff,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Increased by more than 30k'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'salary raised by more than 20000 and less than 30000'
        ELSE 'Salary raise is less than 20000'
    END AS salary_increase
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
        JOIN
    salaries s ON d.emp_no = s.emp_no
    group by d.emp_no;
    
    SELECT 
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_diff,
   if (max(s.salary)-min(s.salary)>30000 , 'Increased by more than 30k', 'Salary raise is less than 30000')
     AS salary_increase
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
        JOIN
    salaries s ON d.emp_no = s.emp_no
    group by d.emp_no;


#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth 
#column, called “current_employee” saying “Is still employed” if the employee is still working 
#in the company, or “Not an employee anymore” if they aren’t.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    IF(MAX(d.to_date) > sysdate(),
        'Is still employee',
        'Not an employee any more') AS current_employee
FROM
    employees e
        JOIN
    dept_emp d ON e.emp_no = d.emp_no
GROUP BY (d.emp_no)
limit 100
;


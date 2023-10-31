use employees;

select emp_no, salary, row_number () over w as row_num 
 from salaries 
   where emp_no= 11839  
    window w as (partition by emp_no order by salary desc) ;
#there is two matching salary that is same salary but different value row_num is given 3rd and 4th row

# using rank

select emp_no , salary, rank() over w as 'rank' 
    from salaries 
    where emp_no=11839 
    window w as (partition by emp_no order by salary desc);

#it works like usuall ranking thats matching values get same rank and next unique value get rank after skipping ranks as much as matching VALUES

#using  Dense_rank()

SELECT emp_no, salary, DENSE_RANK() over w as 'dense_rank' 
   from salaries 
   where emp_no=11839 
   window w as (partition by emp_no order by salary desc);
   
   
#exerice 

#Write a query that upon execution, displays the number of salary contracts that each manager 
#has ever signed while working in the company.

SELECT 
    dm.emp_no, COUNT(s.salary) AS No_of_salary
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no
ORDER BY dm.emp_no;

#Write a query that upon execution retrieves a result set containing all salary values that
# employee 10560 has ever signed a contract for. Use a window function to rank all salary values 
#from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks 
#for subsequent rows are allowed.

SELECT emp_no, salary, RANK() over w as 'rank'
  from salaries where emp_no=10560 
  WINDOW w as (partition by emp_no order by salary desc);
  
  
#Write a query that upon execution retrieves a result set containing all salary values that 
#employee 10560 has ever signed a contract for. Use a window function to rank all salary values 
#from highest to lowest in a way that equal salary values bear the same rank and that gaps in 
#the obtained ranks for subsequent rows are not allowed.

SELECT emp_no, salary, DENSE_RANK() OVER w AS 'dense rank'
from salaries where emp_no=10560 window w as (partition by emp_no order by salary desc);


#working with ran () and join function together

# Exercise 1

#Write a query that ranks the salary values in descending order of all contracts signed by employees numbered 
#between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank.
# Also, allow gaps in the ranks obtained for their subsequent rows.

select e.emp_no , s.salary , rank() over w as 'rank'
  from employees e join salaries s on e.emp_no=s.emp_no where  e.emp_no between 10500 and 10600
  window w as (partition by e.emp_no order by s.salary desc);
  
  

#exercise 2

# Exercise 2:

#Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:

#contracts that have been signed by employees numbered between 10500 and 10600 inclusive.

#contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.

#In addition, let equal salary values of a certain employee bear the same rank. 
#Do not allow gaps in the ranks obtained for their subsequent rows.


SELECT 
    e.emp_no, 
    s.salary,
    (YEAR(s.from_date)-YEAR(e.hire_date)) AS 'year',
    DENSE_RANK() OVER W AS 'RANK'
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
        AND YEAR(s.from_date)-YEAR(e.hire_date) >= 5
WHERE
    e.emp_no BETWEEN 10500 AND 10600
WINDOW W AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);

select year(from_date) from salaries;

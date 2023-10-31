#Exercise #1 :

#  Write a query that upon execution, assigns a row number to all managers we have information for in the
# "employees" database (regardless of their department).

#Let the numbering disregard the department the managers have worked in. Also, let it start from the value 
#of 1. Assign that value to the manager with the lowest employee number.

select *, row_number() over(order by emp_no ) as 'row number' from dept_manager d where d.emp_no in (select e.emp_no from employees e);

select *, row_number() over(order by emp_no ) as 'row number' from dept_manager d where exists (select e.emp_no from employees e where e.emp_no=d.emp_no);

#Exercise #2:

#Write a query that upon execution, assigns a sequential number for each employee number registered 
#in the "employees" table. Partition the data by the employee's first name and order it by their 
#last name in ascending order (for each partition).

select first_name,last_name,e.emp_no , row_number() over(partition by e.first_name  order by e.last_name) as 'row_number' from employees e;


#two window function

use employees;
 select emp_no,salary,
 row_number() over(partition by emp_no) as window1,
 row_number() over(partition by emp_no order by salary desc) as window2
  
 
 from salaries;
 
 
 
#Exercise #1:

#Obtain a result set containing the salary values each manager has signed a contract for. 
#To obtain the data, refer to the "employees" database.
#Use window functions to add the following two columns to the final output:
# a column containing the row number of each row from the obtained dataset, starting from 1.
# a column containing the sequential row numbers associated to the rows for each manager, where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
#Finally, while presenting the output, make sure that the data has been ordered by the values
# in the first of the row number columns, and then by the salary values for each partition in ascending order.

select d.emp_no , s.salary , 
           row_number() over() as window1 ,
           row_number() over(partition by d.emp_no order by s.salary ) as window2
           
from dept_manager d join salaries s 
                on d.emp_no=s.emp_no;
                
                
# Exercise #2:
#Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
#Use window functions to add the following two columns to the final output:
# a column containing the row numbers associated to each manager, where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
# a column containing the row numbers associated to each manager, where their highest salary has been given the number of 1, and the lowest - a value equal to the number of rows in the given partition.
# Let your output be ordered by the salary values associated to each manager in descending order.

select d.emp_no, s.salary , row_number() over(partition by d.emp_no order by s.salary Asc) as window1 ,
                row_number() over(partition by d.emp_no order by s.salary Desc) as window2
	from dept_manager d join salaries s on d.emp_no=s.emp_no;
    
    
#alternative way to write window function
select emp_no , salary , row_number() over w as "row_number" 
from salaries  window w as (partition by emp_no order by salary Desc);

#exercise
#Write a query that provides row numbers for all workers from the "employees" table, partitioning the data by their first names 
#and ordering each partition by their employee number in ascending order.

select emp_no , first_name , last_name ,row_number() over w as "row_number" from employees 
window w as (partition by first_name order by emp_no);


#The PARTITION BY Clause vs the GROUP BY Clause - Exercise

# Exercise #1:
#Find out the lowest salary value each employee has ever signed a contract for. 
#To obtain the desired output, use a subquery containing a window function, as well as a window 
#specification introduced with the help of the WINDOW keyword.
#Also, to obtain the desired result set, refer only to data from the “salaries” table.

select a.emp_no, a.salary  from 
( select * , row_number() over w as 'row_num' from salaries window w as
 (partition by emp_no order by salary)) a 
 where row_num=1;
 
 #use groupby and window function
 select a.emp_no,min(a.salary) as min_salary from (select *, row_number() over w as 'row_num' from salaries window w as (partition by emp_no order by salary) ) a group by emp_no;
 
 
# Exercise #3:
#Once again, find out the lowest salary value each employee has ever signed a contract for. 
#This time, to obtain the desired output, avoid using a window function. 
#Just use an aggregate function and a subquery.

select emp_no , min(salary) from (select emp_no , salary from salaries) a group by a.emp_no;
 
#select second lowest salary each employ recieved

select a.emp_no , a.salary as second_lowest from (select *,row_number() over w as row_num from salaries window w as (partition by emp_no order by salary)) a where row_num=2;

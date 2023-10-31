#select salary of emp_no 1001,previous salary (preceeding) , next salary( succeding) 
#diference between previous and curent and also diference bewteen curent and 

select emp_no ,
       salary ,
	   lag(salary) over w as 'previous salary',
	   lead(salary) over w as 'next_salary' , salary-lag(salary) over w as 'lag diff' ,
       Lead(salary) over w -salary as 'lead diff' 
from salaries 
where emp_no=10001
	  window w as (order by salary);

select a.emp_no , a.salary,a.previous_salary,
        a.next_salary,a.salary-a.previous_salary as 'previous',
        a.next_salary-a.salary as 'next' 
from
       (select emp_no ,salary ,lag(salary) over w as 'previous_salary',
                lead(salary) over w as 'next_salary' 
		from salaries 
        where emp_no=10001
		window w as (order by salary)) as a;

#Exercise 1

#Write a query that can extract the following information from the "employees" database:
#the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive
#a column showing the previous salary from the given ordered list
#a column showing the subsequent salary from the given ordered list
#a column displaying the difference between the current salary of a certain employee and their previous salary
#a column displaying the difference between the next salary of a certain employee and their current salary
#Limit the output to salary values higher than $80,000 only.
#Also, to obtain a meaningful result, partition the data by employee number.

SELECT emp_no ,salary, lag(salary) over w as 'previous salary' , 
       lead(salary) over w as 'next_salary',
       salary-lag(salary)over w as "lag dif" ,
	   lead(salary) over w -salary as 'lead_diff'
from salaries 
where (emp_no between 10500 and 10600) and (salary>80000) 
window w as (partition by emp_no order by salary);


#Exercise 2
#create a query whose result set contains data arranged by the salary values associated to each employee number (in ascending order). Let the output contain the following six columns:
#the employee number
#the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)
#the employee's previous salary
#the employee's contract salary value preceding their previous salary
#the employee's next salary
#the employee's contract salary value subsequent to their next salary
#Restrict the output to the first 1000 records you can obtain.

select emp_no, salary, 
       lag(salary) over w as 'previous' , 
       lag(salary , 2) over w as 'two lag',
       lead(salary) over w as 'next',
       lead(salary, 2) over w as 'two lead'
from salaries
window w as (partition by emp_no order by from_date)
limit 1000;

select * from salaries;

select * 
from 
      (select emp_no,salary, row_number() over w as 'rownum',
      lead(salary) over w as previous_salary,
      salary-lead(salary) over w as 'slry_diff' from salaries
      window w as (partition by emp_no order by from_date desc)) a
where emp_no=10001 and
rownum=1;	

       
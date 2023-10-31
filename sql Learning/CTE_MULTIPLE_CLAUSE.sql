#Exercise #1:

#Use two common table expressions and a SUM() function in the SELECT statement of 
#a query to obtain the number of male employees whose highest salaries have been 
#below the all-time average.

with cte_avg_salary as (select avg(salary) as avg_salary from salaries),
      cte_male_highst_salary as ( select e.emp_no,max(s.salary) as max_salary  
	  from employees e join salaries s on s.emp_no=e.emp_no 
      where e.gender='M' group by e.emp_no)
select sum(case 
			when c2.max_salary<c1.avg_salary then 1 
            else 0 
            end) as 'No.of_male_employee_below_avg_salary'
from  employees e 
        join cte_male_highst_salary c2 on e.emp_no=c2.emp_no
		cross join cte_avg_salary c1;
        
        
#Exercise 2
#Use two common table expressions and a COUNT() function in the SELECT statement 
#of a query to obtain the number of male employees whose highest salaries have 
#been below the all-time average.  

with cte1 as (select avg(salary) as 'avg_salary' from salaries),
     cte2 as (select e.emp_no , max(s.salary) as 'max_salary' 
			 from employees e 
             join salaries s on e.emp_no=s.emp_no and e.gender='M' 
             group by e.emp_no)
select count(case when c1.avg_salary> c2.max_salary 
			then c2.max_salary 
            else Null
            end) as 'below_average'
from cte2 c2 join employees e on e.emp_no=c2.emp_no
             cross join cte1 c1;
             
             
#exercise 3
#Does the result from the previous exercise change if you used the Common Table 
#Expression (CTE) for the male employees' highest salaries in a FROM clause, 
#as opposed to in a join?             

with cte1 as (select avg(salary) as 'avg_salary' from salaries),
     cte2 as (select e.emp_no , max(s.salary) as 'max_salary' 
			 from employees e 
             join salaries s on e.emp_no=s.emp_no and e.gender='M' 
             group by e.emp_no)
select count(case when c1.avg_salary> c2.max_salary 
			then c2.max_salary 
            else Null
            end) as 'below_average'
from cte2 c2 join cte1 c1;
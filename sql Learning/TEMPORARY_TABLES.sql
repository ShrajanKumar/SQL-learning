#Exercise #1:

#Store the highest contract salary values of all male employees in a temporary table called 
#male_max_salaries.

create temporary TABLE male_highest_salary
select e.emp_no,max(s.salary) as max_salary 
        from employees e 
        join salaries s on e.emp_no=s.emp_no  and e.gender='M'
        group by e.emp_no;
        
SELECT 
    *
FROM
    male_highest_salary;
    
# Exercise #2:

# Write a query that, upon execution, allows you to check the result set contained in 
# the male_max_salaries temporary table you created in the previous exercise.
select * from male_highest_salary;


#u canot perform self join or union on same temporary table 
drop table if exists dates;
create temporary table dates
select subdate(now(), Interval 1 year) as previous_year,
	    now() as 'current_date',
        subdate(now(), Interval -1 month) as next_month
        ;
#note if u use subdate it goes back, to go forward use - 
#but if you use date_sub() it goes forward use - symbol to go backward
select * from dates;

#now if u tryself join or union it throws error cant reopen table d1
SELECT 
    *
FROM
    dates d1 
UNION SELECT 
    *
FROM
    dates d2;

#self join also throws same error
SELECT 
    *
FROM
    dates d1
        JOIN
    dates d2;

#so one can use CTE now it works

with cte as (select subdate(now() , interval 1 year) as previous_year, 
					now()  as 'current_date' , 
					subdate(now() , Interval -1 month) as next_month)
select * from dates d1 join cte c;

#even union all works

with cte as (select subdate(now() , interval 1 year) as previous_year, 
					now()  as 'current_date' , 
					subdate(now() , Interval -1 month) as next_month)
select * from dates union all select * from cte;

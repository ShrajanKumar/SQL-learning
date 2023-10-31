#Number of female employee contracts that has salary above the average salary of employees

with cte as
          (select avg(salary) as avg_salary from salaries)
select sum(case when s.salary>c.avg_salary then 1
				else 0  
                end) as 'no.of female employee with above avg_salary'
		,count(s.salary) 'Total no of female salary contract'
from employees e 
			join salaries s on e.emp_no=s.emp_no and e.gender="F"
			cross join cte c;
 
 #or
SELECT 
    SUM(CASE
        WHEN s.salary > c.avg_salary THEN 1
        ELSE 0
    END) as 'no.of female employee with above avg_salary',
    COUNT(s.salary) as  'Total no of female salary contract'
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
        JOIN
    (SELECT 
        AVG(salary) AS avg_salary
    FROM
        salaries) AS c;
        
        
#exerice 1 
#Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in 
#a query to find out how many male employees have never signed a contract with a salary 
#value higher than or equal to the all-time company salary average.

with cte as (SELECT AVG(SALARY) as avg_salary FROM salaries) 
select sum(case when s.salary<c.avg_salary then 1 else 0 end) as male_contacts_with_below_avg_salary,
	count(s.salary) as 'No_of_male_contracts' 
from employees e 
		join salaries s on e.emp_no=s.emp_no and e.gender='M'
join cte c;

#exercise 2
#Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the 
#SELECT statement of a query to find out how many male employees have never signed 
#a contract with a salary value higher than or equal to the all-time company salary 
#average.

with cte as (select avg(salary) as avg_salary from salaries)
select count(case 
				 when s.salary<c.avg_salary
                 then s.salary
                 else null 
                 end) as male_contacts_with_below_avg_salary,
		count(s.salary) as 'No_of_male_contracts'
from employees e 
join salaries s on e.emp_no=s.emp_no and e.gender='M'
join cte c ;


#exercise 3
#use MySQL joins (and don’t use a Common Table Expression) in a query to find out 
#how many male employees have never signed a contract with a salary value higher than 
#or equal to the all-time company salary average (i.e. to obtain the same result as 
#in the previous exercise)

SELECT

    SUM(CASE

        WHEN s.salary < a.avg_salary THEN 1

        ELSE 0

    END) AS no_salaries_below_avg,

    COUNT(s.salary) AS no_of_salary_contracts

FROM

    (SELECT

        AVG(salary) AS avg_salary

    FROM

        salaries s) a

        JOIN

    salaries s

        JOIN

    employees e ON e.emp_no = s.emp_no AND e.gender = 'M';
    
#exercise 4  
#Use a cross join in a query to find out how many male employees have never signed a 
#contract with a salary value higher than or equal to the all-time company salary 
#average (i.e. to obtain the same result as in the previous exercise).    
    
    
    WITH cte AS (

SELECT AVG(salary) AS avg_salary FROM salaries

)

SELECT

SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg_w_sum,

# COUNT(CASE WHEN s.salary < c.avg_salary THEN s.salary ELSE NULL END) AS no_salaries_below_avg_w_count,

COUNT(s.salary) AS no_of_salary_contracts

FROM salaries s JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M' CROSS JOIN cte c;


#CTE WITH MULTIPLE CLAUSE

# No.of female employees whos max salary is above average salary

with cte1 as (select avg(salary) as 'over_all_avg_salary'from salaries),
cte2 as (select e.emp_no,max(s.salary) as 'Max_salary_of_employee' from salaries s 
                          join employees e on e.emp_no=s.emp_no where e.gender='F' 
                          group by emp_no)
select sum(case 
               when  cte2.Max_salary_of_employee > cte1.over_all_avg_salary then 1
               else 0 end) as "No of female emply with max slry baoe avrge"
      from cte2 cross join cte1;
      
#one more 

with cte1 as (select avg(salary) as 'over_all_avg_salary'from salaries),
cte2 as (select e.emp_no,max(s.salary) as 'Max_salary_of_employee' from salaries s 
                          join employees e on e.emp_no=s.emp_no where e.gender='F' 
                          group by emp_no)
select sum(case 
               when  c2.Max_salary_of_employee > cte1.over_all_avg_salary then 1
               else 0 end) as "No of female emply with max slry above avrge",
		count(c2.emp_no) as count_of_female_emply,
        concat(round((sum(case 
               when  c2.Max_salary_of_employee > cte1.over_all_avg_salary then 1
               else 0 end)/count(c2.emp_no))*100,2) ,'%')
      from cte2 c2 cross join cte1; 

      


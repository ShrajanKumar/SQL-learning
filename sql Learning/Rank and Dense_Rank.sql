use employees;

select emp_no, salary, row_number () over w as row_num 
from salaries where emp_no= 11839  window w as (partition by emp_no order by salary) ;
#there is two matching salary that is same salary but different value row_num is given
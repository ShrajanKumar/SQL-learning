use employees;


#creating procedures
drop procedure if exists employee_details;

delimiter $$

create procedure employee_details()
begin
select * from employees limit 1000;
end $$
delimiter ;

#calling stored routins
Call employees.employee_details();
call employee_details();


#Create a procedure that will provide the average salary of all employees.

#Then, call the procedure.

drop procedure if exists emp_avg_slry;

delimiter $$

create procedure emp_avg_slry()
begin
select  avg(salary) from salaries;
end $$

delimiter ;

#calling the function
call employees.emp_avg_slry();

drop procedure salary;


#create a procedure which intakes emp_no and returns all salary detail of that employee

drop procedure if exists emp_salary;

delimiter $$
create procedure emp_salary(in p_emp_no int)
Begin

select e.first_name , e.last_name, s.salary , s.from_date

from employees e join salarie s on e.emp_no=s.emp_no

where e.emp_no=p_emp_no;

end $$
Delimiter ;

#to get average salary

drop procedure if exists avg_emp_salary;

delimiter $$

create procedure avg_emp_salary(in p_emp_no int)
Begin
select e.first_name , e.last_name, avg(s.salary)
from employees e join salaries s on e.emp_no=s.emp_no
where e.emp_no=p_emp_no
group by e.emp_no;
End $$

Delimiter ;


#using IN and OUTPUT variables in stored procedure

drop procedure if exists average_salary;

Delimiter $$

use employees $$

create procedure average_salary (IN p_emp_no INTEGER , OUT p_avg_salary DECIMAL(10,2))
Begin

select avg(salary) into p_avg_salary

from employees e join salaries s on e.emp_no=s.emp_no

where e.emp_no = p_emp_no;

end$$

delimiter ;
call employees.average_salary(11300,@xyz);
select @xyz;

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an 
#individual, and returns their employee number.

drop procedure if exists emply_detail;

delimiter $$

create procedure emply_detail(IN p_first_name varchar(20), IN p_last_name varchar(20),out p_emp_no INT)

begin

select emp_no into p_emp_no from employees e 

where e.first_name=p_first_name and e.last_name=p_last_name;

end$$

delimiter ;

call emply_detail('Lillian' , 'Fontet',@p_emp_no);

#creating variable and asigning output of stored procedure to defined vairable

#first create procedure
drop procedure if exists average_salary;

delimiter $$

create procedure average_salary(in p_emp_no Integer , out p_avg_salary decimal(10,2))
begin
select avg(s.salary) into p_avg_salary from salaries s where s.emp_no=p_emp_no;
end$$
delimiter ;

#create variable
SET @v_average_salary=0;
call average_salary(11300 , @v_average_salary);
select @v_average_salary;

#Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

#Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

#Finally, select the obtained output.

SET @v_emp_no=0;

call employees.emply_detail('Aruna','Journel',@v_emp_no);

select @v_emp_no;

#stored function

use employees;

drop function if exists f_average_salary;

delimiter $$
create function f_average_salary(p_emp_no int) returns decimal(10,2)
DETERMINISTIC
begin
DECLARE v_average_salary decimal(10,2);
SELECT 
    AVG(s.salary)
INTO v_average_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
return v_average_salary ;
end $$
delimiter ;

#running the function

select f_average_salary(11300);


#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract 
#of that employee.

#Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and 
#v_salary, that will be of the DECIMAL (10,2) type.


drop function if exists emp_info;

delimiter $$

create function emp_info(p_first_name varchar(255) , p_last_name varchar(255)) returns  DECIMAL(10,2)
 deterministic
Begin 
declare v_salary Decimal(10,2);
declare v_max_from_date DATE;
SELECT 
    MAX(s.from_date)
INTO v_max_from_date FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    (e.first_name = p_first_name
        AND e.last_name = p_last_name);
    
SELECT 
    s.salary
INTO v_salary FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
    
return v_salary;

end$$
delimiter ;

select emp_info('Aruna','Journel');

#or
SELECT 
    s.salary AS latest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.first_name = 'Aruna'
        AND e.last_name = 'JOURNel'
        AND s.from_date = (SELECT 
            MAX(from_date)
        FROM
            salaries s
                JOIN
            employees e ON s.emp_no = e.emp_no
        WHERE
            e.first_name = 'Aruna'
                AND e.last_name = 'Journel');




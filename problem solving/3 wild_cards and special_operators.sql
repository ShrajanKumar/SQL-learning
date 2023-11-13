#1. From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
#Sample table: salesman

SELECT 
    *
FROM
    salesman
WHERE
    city = 'paris' OR city = 'rome';
    
 #or
 
SELECT 
    *
FROM
    salesman
WHERE
    city IN ('paris' , 'rome');
    

#3. From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome.
# Return salesman_id, name, city, commission.  
#Sample table: salesman

SELECT 
    *
FROM
    salesman
WHERE
    NOT city IN ('paris' , 'rome');
    
#or
SELECT 
    *
FROM
    salesman
WHERE
    NOT (city = 'paris' OR city = 'rome');

#or 
select * from salesman where city not in ('paris' , 'rome');

#4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  
#Sample table: customer
SELECT 
    *
FROM
    customer
WHERE
    customer_id IN (3007 , 3008, 3009);


#5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  
#Sample table: salesman
SELECT 
    *
FROM
    salesman
WHERE
    commission <= 0.14
        AND commission >= 0.12;


#6. From the following table, write a SQL querry to select orders between 500 and 4000 (begin and end values are included). 
#Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
#Sample table: orders
SELECT 
    *
FROM
    orders
WHERE
    (purch_amnt BETWEEN 500 AND 4000)
        AND purch_amnt <> 948.50
        AND purch_amnt <> 1983.43;
#or 
SELECT 
    *
FROM
    orders
WHERE
    purch_amnt BETWEEN 500 AND 4000
        AND NOT purch_amnt IN (948.50 , 1983.43);

#7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
#Sample table: salesman
SELECT 
    *
FROM
    salesman
WHERE
    name BETWEEN 'A' AND 'L';

#8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
#Sample table: salesman
SELECT 
    *
FROM
    salesman
WHERE
    NOT name BETWEEN 'A' AND 'L';

#9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
#Sample table: customer
SELECT 
    *
FROM
    customer
WHERE
    cust_name LIKE ('B%');

#10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
#Sample table: customer
SELECT 
    *
FROM
    customer
WHERE
    cust_name LIKE ('%n');
    
#11. From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 
#Sample table : salesman    
SELECT 
    *
FROM
    salesman
WHERE
    name LIKE ('N__l%');

CREATE TABLE testtable (
    col1 VARCHAR(100) -- Adjust the length based on your actual data size
);

INSERT INTO testtable (col1)
VALUES
    ('A001/DJ-402\44_/100/2015'),
    ('A001_\DJ-402\44_/100/2015'),
    ('A001_DJ-402-2014-2015'),
    ('A002_DJ-401-2014-2015'),
    ('A001/DJ_401'),
    ('A001/DJ_402\44'),
    ('A001/DJ_402\44\2015'),
    ('A001/DJ-402%45\2015/200'),
    ('A001/DJ_402\45\2015%100'),
    ('A001/DJ-402%45\2015/300'),
    ('A001/DJ-402\44');

#12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
#Sample table: testtable
select * from testtable where col1 like("%/_%") escape '/';

#13. From the following table, write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 NOT LIKE ('%/_%') ESCAPE '/';

#14. From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 LIKE ('%/%');

#15. From the following table, write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 NOT LIKE ('%/%');

#16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 LIKE '%|_/%' ESCAPE '|';


#17. From the following table, write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
#Sample table: testtable
select * from testtable where col1 not like "%|_/%" escape '|' ;


#18. From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 LIKE ('%/%%') ESCAPE '/';


#19. From the following table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
#Sample table: testtable
SELECT 
    *
FROM
    testtable
WHERE
    col1 NOT LIKE '%/%%' ESCAPE '/';

#20. From the following table, write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.
#Sample table: customer
SELECT 
    *
FROM
    customer
WHERE
    grade IS NULL;

#21. From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
#Sample table: customer
select * from customer where grade is not null;

#or
select * from customer where not grade is null;

#22. From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. Go to the editor
#Sample table: emp_details

SELECT 
    *
FROM
    emp_details
WHERE
    EMP_LNAME LIKE 'D%';

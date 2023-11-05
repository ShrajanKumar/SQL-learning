# practice exercises on retrieving data from table

use w3_resource;

#creating salesman table required for upcoming exercises
drop table if exists salesman;
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5 , 2 )
);

insert into salesman (salesman_id,name,city,commission) 
values (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5007, 'Paul Adam', 'Rome', 0.13),
       (5003, 'Lauson Hen', 'San Jose', 0.12);

# 1. Write a SQL statement that displays all the information about all salespeople.
SELECT 
    *
FROM
    salesman;

# 2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 
select "This is SQL Exercise, Practice and Solution";

#3. Write a SQL query to display three numbers in three columns.
SELECT 6 AS c1, 2 AS c2, 3 AS c3;

#4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.
SELECT 10 + 5;
 

#5. Write an SQL query to display the result of an arithmetic expression.
select 10+15-5*2;


#6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.  

SELECT 
    name, commission
FROM
    salesman;
    
#create order table 

drop table if exists orders;

CREATE TABLE orders (
    ord_no INT,
    purch_amnt DECIMAL,
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amnt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);
    

#7. Write a query to display the columns in a specific order, such as order date, salesman ID, 
#order number, and purchase amount for all orders. 
SELECT 
    ord_date, salesman_id, ord_no, purch_amnt
FROM
    orders;

#8. From the orders table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 
SELECT DISTINCT
    salesman_id
FROM
    orders;

#9. From the salesman table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city. 
SELECT 
    name, city
FROM
    salesman
WHERE
    city = 'Paris';
 
 #creating customer table
 
 drop table if exists customer;
 
 CREATE TABLE customer (
    customer_id INT,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
); 

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);


# 10. From the customer table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.  
SELECT 
    customer_id, cust_name, city, grade, salesman_id
FROM
    customer
WHERE
    grade = 200;

#11. From the orders table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.  
SELECT 
    ord_no, ord_date, purch_amnt
FROM
    orders
WHERE
    salesman_id = 5001; 
    
#creating new table 

CREATE TABLE awards (
    year INT,
    subject VARCHAR(50),
    winner VARCHAR(100),
    country VARCHAR(50),
    category VARCHAR(50)
);


INSERT INTO awards (year, subject, winner, country, category)
VALUES
    (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
    (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
    (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
    (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
    (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
    (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
    (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
    (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
    (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
    (1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
    (1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
    (1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
    (1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
    (1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
    (1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
    (1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
    (1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
    (1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
    (1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
    (1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
    (1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
    (1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
    (1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
    (1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

# 12. write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 
SELECT 
    year, subject, winner
FROM
    awards
WHERE
    year = 1970;


# 13. write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner
SELECT 
    winner
FROM
    awards
WHERE
    year = 1971 AND subject = 'Literature';
    
    
# 14. write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.
SELECT 
    year, subject
FROM
    awards
WHERE
    winner = 'Dennis Gabor';


# 15. write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 
SELECT 
    winner
FROM
    awards
WHERE
    subject = 'Physics' AND year >= 1950;


# 16. write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.  
SELECT 
    year, subject, winner, country
FROM
    awards
WHERE
    subject = 'Chemistry'
        AND (year BETWEEN 1965 AND 1975);


#17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
SELECT 
    *
FROM
    awards
WHERE
    year > 1972
        AND winner IN ('Menachem Begin' , 'Yitzhak Rabin');


#18.  write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.  
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    winner LIKE ('Louis%');


#19. write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category. 
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    (subject = 'Physics' AND year = 1970)
        OR (subject = 'Economics' AND year = 1971);

#one calalso be solved using union
(SELECT 
    *
FROM
    awards
WHERE
    subject = 'physics' AND year = 1970 )
UNION (SELECT 
    *
FROM
    awards
WHERE
    subject = 'Economics' AND year = 1971);        


#20. write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    year = 1970
        AND subject NOT IN ('Physiology' , 'Economics');
        
#21.  write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 

    (SELECT 
        year, subject, winner, country, category
    FROM
        awards
    WHERE
        subject = 'Physiology' AND year < 1971) 
UNION (SELECT 
    *
FROM
    awards
WHERE
    subject = 'Peace' AND year >= 1974)  ;
    
#alternative
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    (subject = 'Physiology' AND year < 1971)
        OR (subject = 'Peace' AND year >= 1974);

#22. From the awards table, write a SQL query to find the details of the Nobel Prize winner 
#'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.  
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    winner = 'Johannes Georg Bednorz';

#23. From the awards table, write a SQL query to find Nobel Prize winners for the subject that 
#does not begin with the letter 'P'. Return year, subject, winner, country, and category.
# Order the result by year, descending and winner in ascending.  
SELECT 
    year, subject, winner, country, category
FROM
    awards
WHERE
    subject NOT LIKE ('P%')
ORDER BY year DESC ,winner ASC;

#24. From the awards table, write a SQL query to find the details of 1970 Nobel Prize winners. 
#Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come 
#at the end of the result set. Return year, subject, winner, country, and category.  
SELECT 
    *
FROM
    awards
WHERE
    year = 1970
ORDER BY CASE
    WHEN NOT subject   IN ('Chemistry' , 'Economics') THEN 0
    ELSE 1
END ASC , subject ASC
; 


#creating new table

CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(255),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);


INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
    (101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

#25. From the item_mast table, write a SQL query to select a range of products whose price is in
# the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, 
#pro_price, and pro_com.
 SELECT 
    pro_id, pro_name, pro_price, pro_com
FROM
    item_mast
WHERE
    pro_price BETWEEN 200 AND 600;
    
#26.From the item_mast, write a SQL query to calculate the average price for a 
#manufacturer code of 16. Return avg. 
SELECT 
    pro_com, AVG(pro_price)
FROM
    item_mast
where pro_com = 16
GROUP BY pro_com
;

#alternative
SELECT 
    pro_com, AVG(pro_price) as average_price
FROM
    item_mast
GROUP BY pro_com
HAVING pro_com = 16;

#27. From the item_mast table, write a SQL query to display the pro_name as 'Item Name' and 
#pro_priceas 'Price in Rs.'  

SELECT 
    pro_name AS 'Item Name', pro_price AS 'Price in Rs'
FROM
    item_mast;


#28. From the item_mast table, write a SQL query to find the items whose prices are higher than 
#or equal to $250. Order the result by product price in descending, then product name in 
#ascending. Return pro_name and pro_price. 
 SELECT 
    pro_name, pro_price
FROM
    item_mast
WHERE
    pro_price > 250
ORDER BY pro_price DESC , pro_name ASC;
 
 

#29. From the item_mast table, write a SQL query to calculate average price of the items for
#each company. Return average price and company code.
SELECT 
    pro_com, AVG(pro_price) AS 'avg_product_price'
FROM
    item_mast
GROUP BY pro_com order by pro_com;


#30. write a SQL query to find the cheapest item(s). 
#Return pro_name and, pro_price. 
SELECT 
    pro_name, pro_price
FROM
    item_mast
WHERE
    pro_price = (SELECT 
            MIN(pro_price)
        FROM
            item_mast); 
            
            #alternative
SELECT 
    pro_name, pro_price
FROM
    item_mast
WHERE
    pro_price = (SELECT 
            pro_price
        FROM
            item_mast
        ORDER BY pro_price
        LIMIT 1);

#creating new table employee detail
CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(255),
    EMP_LNAME VARCHAR(255),
    EMP_DEPT INT
);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57);

#31.write a SQL query to find the unique last name of all employees. Return emp_lname. 

select distinct emp_lname from  emp_details ;

#32. From the emp_detail table, write a SQL query to find the details of employees whose last name is 'Snares'. 
select * from emp_details where emp_lname='Snares';

# 33. write a SQL query to retrieve the details of the employees who work in the department 57.

select * from emp_details where emp_dept=57;


use w3_resource;

#1. From the following table, write a SQL query to locate the details of 
#customers with grade values above 100. Return customer_id, cust_name, city,
# grade, and salesman_id. 

#Sample table: customer

SELECT 
    *
FROM
    customer
WHERE
    grade > 100;
    
# 2. From the following table, write a SQL query to find all the customers 
#in ‘New York’ city who have a grade value above 100. 
#Return customer_id, cust_name, city, grade, and salesman_id.  

#Sample table: customer

SELECT 
    *
FROM
    customer
WHERE
    city = 'New York' AND grade > 100;
    
#3. From the following table, write a SQL query to find customers who are from 
#the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.  
#Sample table: customer    
SELECT 
    *
FROM
    customer
WHERE
    city = 'New york' OR grade > 100;

#4. From the following table, write a SQL query to find customers who are either 
#from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.  
#Sample table: customer  
SELECT 
    *
FROM
    customer
WHERE
    city = 'New York' OR grade <= 100;
    
SELECT 
    *
FROM
    customer
WHERE
    city = 'New York' OR not grade > 100;    

    
#5.From the following table, write a SQL query to identify customers who do not 
#belong to the city of 'New York' or have a grade value that exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id.  
#Sample table: customer
SELECT 
    *
FROM
    customer
WHERE
   not (city='New York' or grade>100);
    
#or
SELECT 
    *
FROM
    customer
WHERE
    city NOT like ('New York') OR grade > 100;

#6. From the following table, write a SQL query to find details of all orders 
#excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 
#or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.  
#Sample table : orders

SELECT * FROM orders WHERE NOT ((ord_date = '2012-09-10' AND salesman_id > 5005) OR (purch_amnt > 1000));


       
#7. From the following table, write a SQL query to find the details of those 
#salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
#Sample table : salesman 
select * from salesman  where commission between 0.10 and 0.12;

#or 
select * from salesman  where  commission <=0.12 and commission>=0.10;


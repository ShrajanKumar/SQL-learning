#1. From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
#Sample table: salesman
#Sample table: customer
SELECT 
    c.cust_name, s.name, s.city
FROM
    customer c
        JOIN
    salesman s ON c.city = s.city;
    
#or

SELECT 
    c.cust_name, s.name, s.city
FROM
    customer c,
    salesman s
WHERE
    c.city = s.city;
    
#2. From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.  
#Sample table: customer salesman

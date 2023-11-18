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

SELECT 
    c.cust_name, s.name
FROM
    customer c
        JOIN
    salesman s ON c.salesman_id = s.salesman_id;
    
#3. From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).  
#Sample table: salesman, customer ,orders   
SELECT 
    o.ord_no, c.cust_name, c.customer_id, s.salesman_id
FROM
    customer c
        JOIN
    salesman s ON c.salesman_id = s.salesman_id
        AND c.city <> s.city
        JOIN
    orders o ON c.customer_id = o.customer_id
        AND s.salesman_id = o.salesman_id;
        
#4. From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name.  
#Sample table: orders, customer 

SELECT 
    c.cust_name, o.ord_no
FROM
    customer c,
    orders o
WHERE
    o.customer_id = c.customer_id;
    
#5. From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city. Return cust_name as "Customer", grade as "Grade".   
#Sample table: salesman ,customer ,orders
SELECT 
    c.cust_name AS 'Customer',
    c.grade AS 'Grade',
    o.ord_no AS 'Order_no'
FROM
    customer c,
    orders o,
    salesman s
WHERE
    o.customer_id = c.customer_id
        AND s.salesman_id = o.salesman_id
        AND c.grade IS NOT NULL
        AND s.city IS NOT NULL;
        
#6. From the following table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City". 
#Sample table: salesman, customer
SELECT 
    c.cust_name AS 'Customer', c.city AS 'City' , s.commission
FROM
    customer c
        JOIN
    salesman s ON c.salesman_id = s.salesman_id
and
    s.commission BETWEEN 0.12 AND 0.14;
    
#7. From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.
#Sample table: salesman ,customer, orders
SELECT 
    c.cust_name,
    o.ord_no,
    s.commission AS 'Commission%',
    o.purch_amnt * s.commission AS 'Commission'
FROM
    customer c
        JOIN
    orders o ON c.customer_id = o.customer_id  and c.grade >=200
        JOIN
    salesman s ON o.salesman_id = s.salesman_id 
    order by Commission;

    
#8. From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.
#Sample table: salesman,Sample table: customer,Sample table: orders

SELECT 
    c.customer_id,
    c.cust_name,
    c.city,
    c.grade,
    s.salesman_id,
    o.ord_no,
    o.purch_amnt,
    o.ord_date
FROM
    customer c
        JOIN
    orders o ON c.customer_id = o.customer_id 
    join salesman s on s.salesman_id=o.salesman_id
    where o.ord_date='2012-10-05';




        

   
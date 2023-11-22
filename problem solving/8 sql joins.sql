#1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
#Sample table: salesman customer
SELECT 
    c.cust_name, s.name as salesman_name,c.city
FROM
    customer c
        JOIN
    salesman s ON c.city = s.city;

#2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
#Sample table: orders customer
SELECT 
    o.ord_no, o.purch_amnt, c.cust_name, c.city
FROM
    customer c
        JOIN
    orders o
WHERE
    c.customer_id = o.customer_id
    and o.purch_amnt between 500 and 2000;
    
#3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
#Sample table: customer  salesman
  SELECT 
    c.cust_name as cust_name, c.city as cust_city, s.name as salesman_name, s.commission
FROM
    salesman s
        JOIN
    customer c ON s.salesman_id = c.salesman_id;
    
#4. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  
#Sample table: customer salesman

SELECT 
    c.cust_name AS 'customername',
    c.city,
    s.name AS 'salesman Name',
    commission
FROM
    customer c
        JOIN
    salesman s ON s.salesman_id = c.salesman_id
WHERE
    s.commission > 0.12;
    
#5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
#Sample table: customer ,salesman

SELECT 
    c.cust_name,
    c.city AS cust_city,
    s.name AS 'salesman_name',
    s.city as 'salesman city',
    commission
FROM
    customer c
        JOIN
    salesman s
on
c.salesman_id=s.salesman_id where c.city<>s.city and 
    s.commission > 0.12;
    
#6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
#Sample table: orders customer salesman
SELECT 
    o.ord_no,
    o.ord_date,
    o.purch_amnt,
    c.cust_name,
    c.grade,
    s.name,
    s.commission
FROM
    customer c
        JOIN
    salesman s ON c.salesman_id = s.salesman_id
        JOIN
    orders o ON c.customer_id = o.customer_id
        AND c.salesman_id = o.salesman_id;
        
# Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
#Sample table: orders 
SELECT 
    c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amnt
FROM
    customer c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id order by o.ord_date desc;
    
# Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
select s.salesman_id , c.customer_id from salesman s left join customer c on s.salesman_id=c.salesman_id;    

#From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
select s.name ,c.cust_name,c.city,c.grADE,o.ord_no,o.ord_date,o.purch_amnt from salesman s left join customer c on s.salesman_id=c.salesman_id left join orders o on o.customer_id=c.customer_id;

# Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
#Sample table: customer ,salesman,orders

SELECT 
    c.cust_name, c.city, c.grade, s.name
FROM
    salesman s
        LEFT JOIN
    customer c ON s.salesman_id = c.salesman_id
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.purch_amnt >= 2000
        AND c.grade IS NOT NULL;
        
#For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
SELECT 
    c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amnt
FROM
    orders o
        LEFT JOIN
    customer c ON c.customer_id = o.customer_id;
	
#Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade
SELECT 
    c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amnt
FROM
    orders o
        LEFT JOIN
    customer c ON o.customer_id = o.customer_id
WHERE
    c.grade IS NOT NULL; 
    
# Write a SQL query to combine each row of the salesman table with each row of the customer table.
select * from salesman cross join customer;
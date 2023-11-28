#1. From the following tables, write a SQL query to find all salespeople and customers located in the city of London.
#Sample table: Salesman, customer

(SELECT 
    salesman_id AS id, name AS 'name', 'salesman' AS 'role'
FROM
    salesman where city='London') UNION ALL (SELECT 
    customer_id AS id, cust_name AS 'name', 'customer' AS 'role'
FROM
    customer where city='London'); 
    
#2. From the following tables, write a SQL query to find all those salespeople and customers who are involved in the inventory management system. Return salesperson ID, customer ID.
#Sample table: orders ,cutomer

SELECT 
    salesman_id, customer_id
FROM
    customer 
UNION SELECT 
    salesman_id, customer_id
FROM
    orders;   
    
#3 From the following table, write a SQL query to find the salespersons who generated the largest and smallest orders on each date. Return salesperson ID, name, order no., highest on/lowest on, order date.
#Sample table: Salesman , Sample table: Orders
with max_ as (select ord_date,max(purch_amnt) as max_purch from orders group by ord_date)
select s.salesman_id, s.name, o.ord_no, 'highest' as 'high/low', o.ord_date 
               from salesman s join orders o 
                       on s.salesman_id =o.salesman_id 
			join max_ 
                        on max_.ord_date=o.ord_date and max_.max_purch=o.purch_amnt
union (with min_ as (select ord_date,min(purch_amnt) as min_purch from orders group by ord_date)
select s.salesman_id, s.name, o.ord_no, 'lowest' as 'high/low', o.ord_date 
               from salesman s join orders o 
                       on s.salesman_id =o.salesman_id 
			join min_ 
                        on min_.ord_date=o.ord_date and min_.min_purch=o.purch_amnt )order by ord_date;  
					;
                    
#4 From the following tables, write a SQL query to find those salespeople who live in the same city where the customer lives as well as those who do not have customers in their cities by indicating 'NO MATCH'. Sort the result set on 2nd column (i.e. name) in descending order. Return salesperson ID, name, customer name, commission.
#Sample table: Salesman , customer

select s.salesman_id, s.name, c.cust_name as 'customer name', s.commission from salesman s join customer c on s.salesman_id=c.salesman_id and s.city=c.city union (with cte as (select s.salesman_id as id from salesman s, customer c where s.salesman_id=c.salesman_id and s.city=c.city) select  salesman_ID, name, "No match" as 'customer name', commission  from salesman where salesman_id not in (select id from cte)) order by 2;

#5 From the following tables, write a SQL query that appends strings to the selected fields, indicating whether the city of any salesperson is matched with the city of any customer. Return salesperson ID, name, city, MATCHED/NO MATCH.
SELECT 
    s.salesman_id, s.name, s.city, 'matched' AS 'match/nomatch'
FROM
    salesman s
        JOIN
    customer c ON s.city = c.city
union (SELECT s.salesman_id,s.name,s.city,'no match' as 'match/nomatch' from salesman s where s.city not in (SELECT city from customer));
                        
#6 From the following table, write a SQL query to create a union of two queries that shows the customer id, cities, and ratings of all customers. Those with a rating of 300 or greater will have the words 'High Rating', while the others will have the words 'Low Rating'.
#Sample table: Customer
SELECT 
    customer_id, city, grade, 'High rating' AS rating
FROM
    customer
WHERE
    grade >= 300 
UNION (SELECT 
    customer_id, city, grade, 'Low rating' AS rating
FROM
    customer
WHERE
    grade < 300) order by 1;
    
#7 From the following table, write a SQL query to find those salespersons and customers who have placed more than one order. Return ID, name.    
#salesman,customer,orders

SELECT 
    salesman_id AS id, name AS 'name'
FROM
    salesman
WHERE
    salesman_id IN (SELECT 
            salesman_id
        FROM
            orders
        GROUP BY salesman_id
        HAVING COUNT(*) > 1) 
UNION (SELECT 
    customer_id AS id, cust_name AS 'name'
FROM
    customer
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            orders
        GROUP BY customer_id
        HAVING COUNT(*) > 1)) order by 1;
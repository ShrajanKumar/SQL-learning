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
select * from orders where ;


#7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
#Sample table: salesman

#8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
#Sample table: salesman

#9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
#Sample table: customer

#10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
#Sample table: customer
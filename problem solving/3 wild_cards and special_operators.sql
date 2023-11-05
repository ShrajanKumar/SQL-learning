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
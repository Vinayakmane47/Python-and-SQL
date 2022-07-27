# Week 08 Challenge : 
-- Q1. ANS : 
USE sakila;
CREATE VIEW active_customer AS 
					(SELECT * FROM customer WHERE store_id = 1);
SELECT *  FROM active_customer;
-- --------------------------------------------------------------------------------------------------------------
# Q2 .ANS : 
USE sakila; 
-- Creating view 
CREATE VIEW customer_detail AS (
SELECT
	c.customer_id ,
    c.first_name, 
    c.last_name ,
    c.email,
    a.address,
    ct.city 
FROM customer AS c 
JOIN address AS a ON a.address_id = c.address_id 
JOIN city ct ON ct.city_id = a.city_id
ORDER BY city ASC );
-- Showing details in View 
SELECT * FROM customer_detail ;
 -- ------------------------------------------------------------------------------------------------------------------------------------------------   
 # Q3. ANS : answer with supporting images is attached in text box 
 
    
    
    
    
    
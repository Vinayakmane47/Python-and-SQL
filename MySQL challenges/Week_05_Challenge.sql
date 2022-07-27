# Week 05 Challenge : 

# Q1. ANS : --- 
USE sakila; 
SELECT 
		payment_id, customer_id, staff_id,rental_id, amount 
FROM payment 
WHERE customer_id IN (10,20,30,40,50,60,70,80,90,100)
AND 
staff_id = 2;

# ------------------------------------------------------------------------------------------------------------

# Q2. ANS : --- 
USE sakila; 
SELECT * 
FROM film 
ORDER BY rating DESC ;

#------------------------------------------------------------------------------------------------------------------------

# Q3. ANS : -- 
USE sakila;
SELECT payment_id , amount , ROUND(2*amount) AS Upated_amount
FROM payment 
WHERE amount > 5 ;

# ----------------------------------------------------------------------------------------------------------------------------------
# Q4. ANS : --- 
USE sakila;
SELECT 
		customer_id ,
        SUM(amount) AS Sum_of_payment ,
        AVG(amount) AS Average_of_payment,
        STDDEV(amount) AS Standard_deviation_of_payment ,
        VARIANCE(amount) AS Variance_of_payment
FROM payment
GROUP BY customer_id ;

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Q5.ANS : --
USE sakila; 
SELECT city_id , city , country_id 
FROM city 
WHERE country_id IN    
		(SELECT country_id FROM country 
          WHERE country LIKE 'A%' OR
		 country like 'B%');

# ------------------------------------------------------------------------------------------------------------------------------------------------------------

#Q6. ANS :--  a.ALL – Comparison with every value ANY – Comparison with atleast one value












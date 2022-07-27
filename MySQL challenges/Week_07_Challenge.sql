-- Week_07 Challenge : 
-- Q1. ANS : 
USE sakila; 
SELECT 'Pramaters' , 'Value'
UNION 
SELECT 'Total Amount' , SUM(amount) 
FROM payment
UNION 
SELECT 'Average Amount' , AVG(amount) 
FROM payment 
UNION 
SELECT 'Minimum Amount' , MIN(amount) 
FROM payment 
UNION 
SELECT 'Maximum Amount' , MAX(amount) 
FROM payment 
UNION 
SELECT 'Variance of Amount' , VARIANCE(amount) 
FROM payment  ;
-- -----------------------------------------------------------------------------------------------------
-- Q2. ANS : 
USE sakila;
SELECT payment_id, customer_id,staff_id, 
SUM(amount) OVER (ORDER BY customer_id) AS TotalSum , 
AVG(amount) OVER (ORDER BY customer_id)  AS Average,
MIN(amount) OVER (ORDER BY customer_id) AS Minimum
FROM payment ;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- Q4. 
USE sakila;
SELECT payment_date ,  COUNT(amount) AS Current_count , 
LAG(COUNT(amount),1) OVER (order by payment_date) as Previous_count ,
(COUNT(amount) - (LAG(COUNT(amount),1) OVER (order by payment_date))) AS Count_Difference,
DATE(payment_date) AS Date
FROM payment 
GROUP BY date
ORDER BY date ASC 




# Week_04 Challenge : 

# Q1. ANS : -- 
USE sakila ;
SELECT film_id ,title , LENGTH(title) AS Length_of_title , # Here length  column  or length of title which one to choose , is not specified  so i have taken Length of title 
		UPPER(description) AS Description
FROM film ;
# -------------------------------------------------------------------------------------------------------------------------

# Q2. ANS :-- 
USE sakila;
SELECT REPEAT (title,3)
FROM film;

# ----------------------------------------------------------------------------------------------------------------

# Q3 . ANS : --- 
USE sakila;
SELECT  film_id , title , LEFT(description,12) AS Description 
FROM film;

#---------------------------------------------------------------------------------------------------------------------

# Q4. ANS : ---
USE sakila ;
SELECT title, REVERSE(REPEAT(title,2)) AS Codeword 
FROM film;

# ----------------------------------------------------------------------------------------------------------------------------------------------

#Q5 .ANS : --
USE sakila;
SELECT 
		 actor_id , first_name, last_name , last_update,
		 DATEDIFF(NOW(),last_update) AS Days_Passed
FROM actor;

# ----------------------------------------------------------------------------------------------------------------------------------------------------------

# Q6. ANS :-- 
USE sakila;
SELECT create_date , DATE(create_date) AS Date , TIME(create_date) AS Time
FROM customer;

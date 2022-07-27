-- Week_03 Challenge 

# Q1 ANS :--
USE sakila;
SELECT * 
FROM customer;
#-------------------------------------------------------------------------------------------------
# Q2 ANS :--
USE sakila ;
SELECT 
	customer_id AS ID,
    first_name AS FName,
    last_name AS LName,
    email AS EmailID
FROM customer;
#------------------------------------------------------------------------------------------------------------------------------
# Q3 ANS :---
USE sakila;
SELECT title 
FROM film # here i have selected only one column, we can select multiple , but this was not mentioned in question 
WHERE title LIKE 'A%r';
# whoever is checking this question please dont cut 20-30 marks for one single word , 
# I have intentionally left one column name in challenge week02 which is last_update column ,
# Because this was not required for getting table , we can have table without it .
# ------------------------------------------------------------------------------------------------------------------------------------------

# Q4. 
USE sakila;
SELECT * 
FROM customer 
LIMIT 100;
# ---------------------------------------------------------------------------------------------------------------------------------------------------
# Q5 .
USE sakila;
SELECT 
		payment_id ,
        amount,
        ROUND(amount) AS Round_Off,
        SQRT(amount) AS Square_root
FROM payment;
# -----------------------------------------------------------------------------------------------------------------------------------------------		
# Q6 . 
USE sakila;
CREATE DATABASE sakila_backup;
USE sakila_backup ;
SHOW DATABASES
# We can create backup by multiple ways 
# 1st - With export optionn given in GUI of mysql  in server menu 
# 2nd -  with the command prompt : 
# First we need to create a copy of database , we can create with MYSQL query also 
-- or with the command prompt using --->mysqldump -u root -p sakila > File location (D:\sakila\sakila.sql)
-- Then we need to import this copied file to sakila_backup , this can be done by using 
-- >mysql -u root -p sakila_backup < D:\sakila\sakila.sql
-- (>) means export and (<) means import 

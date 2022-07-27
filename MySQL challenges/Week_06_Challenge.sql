# Week_06 Challenge : 

# Q1. ANS : --
USE sakila ; 
SELECT c.city_id, c.city, ct.country_id, ct.country 
FROM city c 
INNER JOIN country ct 
ON c.country_id = ct.country_id ;

# --------------------------------------------------------------------------------------------------------------------------------

# Q2. ANS :-- 
USE sakila;
SELECT f.film_id , f.title , f.description ,fc.category_id , c.name 
FROM film AS f
INNER JOIN film_category AS fc 
ON f.film_id = fc.film_id 
INNER JOIN category AS c
ON  fc.category_id = c.category_id;

# --------------------------------------------------------------------------------------------------------------------------------

# Q3. ANS : --- 
USE sakila; 
SELECT f.film_id , f.title, f.description , i.inventory_id,ft.description 
FROM film f
LEFT JOIN inventory i 
ON f.film_id = i.film_id 
LEFT JOIN film_text ft 
ON  i.film_id = ft.film_id;

# ----------------------------------------------------------------------------------------------------------------------------------------------------

# Q4. ANS : -- 
USE sakila ; 
SELECT s.staff_id, s.first_name, s.last_name, p.amount, p.payment_date, r.rental_date, r.return_date 
FROM staff AS  s 
LEFT JOIN payment  AS p 
		ON s.staff_id = p.staff_id 
LEFT JOIN rental  AS r 
		ON p.rental_id = r.rental_id;






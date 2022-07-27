# Project-1 : 
#=================================================================================================================================================================
#CREATE DATABASE ecommerce;
USE ecommerce; 
DESC users_data;
SELECT * FROM users_data LIMIT 100 ; 
-- ----------------------------------------------------------------------------------------------------------------------------
-- Q5. How many distinct values exist in table for field country and language? 
SELECT  COUNT(DISTINCT country) AS distinct_country,  COUNT(DISTINCT language)  AS distinct_language
FROM users_data ;
-- ANS : country has 200 distict values and langues have 5 distinct values 
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q6. Check whether male users are having maximum followers or female users ? 
SELECT gender , SUM(socialNbFollowers) AS followers 
FROM users_data GROUP BY gender;
-- ANS : Female Followers = 262458 , Male Followers = 77038
-- Females have more follower than Male
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q7.Calculate the total users those.
-- a. Uses Profile Picture in their Profile : 
	SELECT COUNT(hasProfilePicture) AS count 
    FROM users_data WHERE hasProfilePicture = 'True';
    -- ANS : - 97018 users uses profile picture in their profile 
    
-- b.Uses Application for Ecommerce platform
-- Note : - Here ecommerce app is not mentioned so took data of HasAnyApp 
	SELECT  COUNT(hasanyapp) AS count 
    FROM users_data WHERE HasAnyApp = 'True';
    -- ANS :  26174 users uses application for Ecommerce platform 
    
-- c. Uses Android app.
	SELECT COUNT(HasAndroidApp) AS count 
    FROM users_data WHERE HasAndroidApp = 'True';
    -- ANS : 4819 users uses android application
-- d . Uses ios app 
	SELECT COUNT(HasIOSApp) AS count 
    FROM users_data WHERE HasIOSApp = 'True';
    -- ANS : 21527 users uses IOS App 
    
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q8 . Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
SELECT country , COUNT(productsBought) AS No_of_Buyers 
FROM users_data 
WHERE productsBought != 0 
GROUP BY country
ORDER BY No_of_Buyers DESC ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q9 . Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
SELECT country , COUNT(ProductsSold) AS No_of_Sellers
FROM users_data 
WHERE ProductsSold != 0 
GROUP BY country 
ORDER BY No_Of_Sellers ASC ;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q10. Display name of top 10 countries having maximum products pass rate.
-- This question is confusing so i have calculated products pass rate by two means 
-- 1ST - Top 10 countries who have maximum product pass rate 
SELECT country , MAX(productspassrate) AS Product_pass_rate
FROM users_data 

GROUP BY country
ORDER BY Product_pass_rate DESC LIMIT 10; 

-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q11. Calculate the number of users on an ecommerce platform for different language choices.
SELECT language , COUNT(language) AS language_choices
FROM users_data 
GROUP BY language ;
-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Q12 . Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
SELECT  'Products_wishlisted' ,  COUNT(gender) AS choices  , gender  
FROM users_data 
WHERE ProductsWished !=0  AND gender ='F'
UNION 
SELECT  'Products_liked' ,  COUNT(gender) AS choices    , gender 
FROM users_data 
WHERE socialProductsLiked !=0 AND gender ='F' ;
  
--  ANS : - 7710 Females have  Wishlisted products  and  13039 Females have Liked the product on Ecommerce Platform.
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q13. Check the choice of male users about being seller or buyer.
SELECT 'Buyers' , COUNT(gender) AS choices , gender 
FROM users_data 
WHERE gender = 'M' AND Productsbought != 0 
UNION 
SELECT 'Sellers' , COUNT(gender) AS choices , gender 
FROM users_data
WHERE ProductsSold != 0 AND gender = 'M';
-- ANS :  1471 are Buyers and 486 are sellers in Ecommerce platform.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Q14. Which country is having maximum number of buyers?
SELECT country ,  COUNT(Productsbought)  AS Buyers 
FROM users_data  
GROUP BY country 
ORDER BY Buyers DESC LIMIT 1 ;
-- France is the country having maximum no of buyers as 25135 
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q15 . List the name of 10 countries having zero number of sellers.
SELECT  country , Productssold 
FROM users_data 
WHERE productssold = 0 
GROUP BY country LIMIT 10 ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q16. Display record of top 110 users who have used ecommerce platform recently.
SELECT *
FROM users_data 
ORDER BY DayssinceLastlogin ASC limit 110 ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q17 . Calculate the number of female users those who have not logged in since last 100 days.
SELECT  COUNT(DayssinceLastLogin) AS Record , gender
FROM users_data 
WHERE gender = 'F' AND DayssinceLastLogin = 100 
ORDER BY DayssinceLastLogin DESC;
-- 23 Females have not logged in since last 100 days 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q18 . Display the number of female users of each country at ecommerce platform.
SELECT country , gender , COUNT(gender) AS No_of_Females
FROM users_data 
WHERE gender = 'F' 
GROUP BY country ;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q19. Display the number of male users of each country at ecommerce platform.
SELECT country , gender , COUNT(gender) AS No_Of_males 
FROM users_data 
WHERE gender = 'M' 
GROUP BY country ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q20 . Calculate the average number of products sold and bought on ecommerce platform by male users for each country.

SELECT country,gender, AVG(productsSold),AVG(productsBought) 
FROM users_data 
WHERE gender ='M'  GROUP BY  country;



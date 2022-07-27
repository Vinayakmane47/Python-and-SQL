CREATE DATABASE practice ; # creating new database 
USE practice;
# Q1.  Write query to create table actor.: 
CREATE TABLE actor (

		actor_id SMALLINT UNSIGNED PRIMARY KEY ,
        first_name VARCHAR(45)  NOT NULL , 
        last_name  VARCHAR(45)   NOT NULL 
        );
        
# Q2  Write query to create table country : 
CREATE TABLE country ( 
		country_id   SMALLINT UNSIGNED  PRIMARY KEY , 
        country      VARCHAR(50)   NOT NULL ,
        last_update    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP 
        );
        
# Q3 . Write query to create table city.
CREATE TABLE city (
			city_id     SMALLINT UNSIGNED PRIMARY KEY ,
            city      VARCHAR(50)   NOT NULL , 
            country_id  SMALLINT UNSIGNED,
            FOREIGN KEY(country_id)
            REFERENCES country(country_id),
            last_update   TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP 

);

# Q4. Write query to create table address. 
CREATE TABLE address ( 
			address_id  SMALLINT UNSIGNED PRIMARY KEY ,
            address      VARCHAR(50)  NOT NULL ,
            address2     VARCHAR(50)  DEFAULT NULL , 
            district     VARCHAR(20)  NOT NULL , 
            city_id SMALLINT UNSIGNED ,
            FOREIGN KEY (city_id) 
            REFERENCES city (city_id),
            postal_code    VARCHAR(10)    DEFAULT NULL , 
            phone          VARCHAR(20)     NOT NULL , 
            last_update    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
            
);


# Q5 .Write a query to insert values in table customer.
USE sakila;
INSERT INTO customer (
					customer_id,
                    store_id,
                    first_name,
                    last_name,
                    email,
                    address_id,
                    active,
                    create_date
								)
VALUES 
		(3000,2,'Vinayak','Mane','vinayak@gmail.com',120,1,'2022-01-01');


#Q6 . Write a query to insert values in table rental. 
USE SAKILA;
INSERT INTO rental( 
	    rental_id , 
        rental_date,
        inventory_id,
        customer_id, 
        return_date,
        staff_id)
VALUES (DEFAULT,'2022-01-02' , 1500,350,NULL,1)








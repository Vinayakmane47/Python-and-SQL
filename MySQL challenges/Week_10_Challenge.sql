# Week 10 Challenge : 
# Q1. ANS : 
USE sakila ;
DELIMITER $$ 
CREATE PROCEDURE getaddress 
( INOUT address1 VARCHAR(16000) ) 
BEGIN
	DECLARE finished INT DEFAULT 0 ;
    DECLARE addresslist VARCHAR(400) DEFAULT "";
    
    DECLARE addressdetail 
		CURSOR FOR 
         SELECT address FROM address;
	DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET finished = 1 ;
	
    OPEN addressdetail ;
    -- start label efination
    loopstart : 
    LOOP 
    FETCH addressdetail INTO addresslist ;
    IF finished = 1 THEN 
    LEAVE loopstart ;
    END IF ;
    SET address1 = CONCAT(addresslist , " ; " , address1);
    END LOOP loopstart ; 
    CLOSE addressdetail ;
    END $$ 
    DELIMITER 
   SET @address1 = "";
   CALL getaddress(@address1) ;
   SELECT @address1;
    
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
# Q2. ANS : 
USE sakila;
DELIMITER && 
CREATE PROCEDURE getactorname 
( INOUT firstname VARCHAR(16000) , 
INOUT lastname VARCHAR(16000) )
BEGIN 
	DECLARE finished INT DEFAULT 0 ;
    DECLARE firstnamelist VARCHAR(400);
    DECLARE lastnamelist VARCHAR(400) ;
    
DECLARE namedetail 
		 CURSOR FOR
         SELECT first_name , last_name FROM actor ;
         DECLARE CONTINUE HANDLER FOR 
         NOT FOUND  SET finished =1 ;
         
        
OPEN namedetail ;
loopstart : 
LOOP 
FETCH namedetail INTO firstnamelist , lastnamelist;
IF finished = 1 THEN 
LEAVE loopstart ;
END IF ;

SET firstname = CONCAT(firstnamelist , " ; " , firstname) ;
SET lastname = CONCAT(lastnamelist , " ; " , lastname ) ;
END LOOP loopstart ;
CLOSE namedetail;
END && 
DELIMITER 

SET @firstname = "" ;
SET @lastname = "";
CALL getactorname(@firstname,@lastname) ;
SELECT @firstname,@lastname;

    
    
    
    
    
    
    
    
    
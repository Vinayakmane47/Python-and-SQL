# Week -09 Challenge : 
# Q1. ANS : 
USE sakila ; 
CREATE TABLE product 
     ( product_id INT PRIMARY KEY ,
	 product_name VARCHAR(50) ,
     preventive_maintainence JSON , 
     repair_schedule JSON );
DESC product;
-- -----------------------------------------------------------------------------------------------------------------------------------------
# Q2.ANS : 
USE sakila ;
INSERT INTO product VALUES 
					(101,'Honda Amaze' ,'{"Part":"Motor" ,"EngineerName":"Astha","MaintenenceDate":"1989-02-16"}' ,
                    '{"RepairDate":"1991-10-14" , "Expenditure":9000}'),
                    (102,'Honda City' ,'{"Part":"Stearing" ,"EngineerName":"Mayank","MaintenenceDate":"1985-04-16"}' ,
                    '{"RepairDate":"1989-01-14" , "Expenditure":19000}'),
                    (103,'Honda WR-V' ,'{"Part":"Seat" ,"EngineerName":"Neha","MaintenenceDate":"1993-03-12"}' ,
                    '{"RepairDate":"1994-01-14" , "Expenditure":10000}'),
                    (104,'Honda JAZZ' ,'{"Part":"Motor" ,"EngineerName":"Astha","MaintenenceDate":"1997-02-10"}',
                    '{"RepairDate":"1996-01-12" , "Expenditure":5000}'),
                    (105,'Honda BR-V' ,'{"Part":"Clutch Plate" ,"EngineerName":"Sameer","MaintenenceDate":"2020-02-10"}',
                    '{"RepairDate":"2020-01-03" , "Expenditure":45000}');


SELECT * FROM product ;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
# Q3 . ANS : 
USE sakila ;
SELECT product_id , product_name ,
		preventive_maintainence ->> '$.Part' AS  Part,
        preventive_maintainence ->> '$.MaintenenceDate' AS Maintainence_Date,
        repair_schedule ->> '$.Expenditure' AS Expenditure
FROM product;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------
# Q4 . ANS : 
USE sakila ;
SELECT product_id , product_name ,
	preventive_maintainence ->> '$.EngineerName' AS EngineerName,
	preventive_maintainence ->> '$.MaintenenceDate' AS MaintenanceDate 
FROM product ;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q5. ANS : 
USE sakila ;
SELECT product_id , product_name ,
	preventive_maintainence ->> '$.EngineerName' AS EngineerName,
	preventive_maintainence ->> '$.MaintenenceDate' AS MaintenanceDate ,
	repair_schedule ->> '$.Expenditure' AS Expenditure,
	repair_schedule ->> '$.RepairDate' AS Repair_Date
FROM product ;














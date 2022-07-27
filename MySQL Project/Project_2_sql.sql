#================================================= Project -2 =============================================#
CREATE DATABASE alumni ;
USE alumni ;
-- Q3. ANS : -- 
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;
#-----------------------------------------------------------------------------------------------------------#
-- Q4. ANS : - This is for reference only , whole code is in  code is in python 
USE alumni;
SELECT * FROM college_a_hs LIMIT 1000;
SELECT * FROM college_a_se LIMIT 1000 ; 
SELECT * FROM college_a_sj  LIMIT 1000; 
SELECT * FROM college_b_hs  LIMIT 1000; 
SELECT * FROM college_b_se  LIMIT 1000; 
SELECT * FROM college_b_sj  LIMIT 1000;  
#------------------------------------------------------------------------------------------------------------#
-- Q5. ANS :-- Answer in EXCEL 
# -----------------------------------------------------------------------------------------------------------# 
-- Q6. ANS :-- 
USE alumni;
CREATE VIEW college_a_hs_v AS (
SELECT *  FROM college_a_hs 
WHERE
	RollNo != '' AND 
    LastUpdate != '' AND 
    Name != '' AND 
    FatherName != '' AND 
    MotherName != ''  AND 
    Batch != '' AND 
    Degree    != '' AND 
    PresentStatus != '' AND 
	EntranceExam != ''  AND EntranceExam != '-' AND EntranceExam != '.' AND EntranceExam != '--' AND
    HSDegree != ''     AND 
    Institute != '' AND Institute != '.'   AND 
    Location != ''  AND Location != '.' ); 
# -------------------------------------------------------------------------------------------------------------# 
-- Q7. ANS : -- 
    USE alumni; 
    CREATE VIEW college_a_se_v AS (
    SELECT * FROM college_a_se 
    WHERE 
		RollNo != '' AND 
		LastUpdate != '' AND 
		Name != '' AND 
		FatherName != '' AND 
		MotherName != ''  AND 
		Batch != '' AND 
		Degree    != '' AND 
		PresentStatus != '' AND
        Organization != '' AND Organization != '-' AND 
        Location !=  '') ;
		
# ----------------------------------------------------------------------------------------------------------------# 
-- Q8. ANS : --- 
USE alumni ;
CREATE VIEW college_a_sj_V AS (
SELECT * FROM college_a_sj 
WHERE 
	RollNo != '' AND 
	LastUpdate != '' AND 
	Name != '' AND 
	FatherName != '' AND 
	MotherName != ''  AND 
	Batch != '' AND 
	Degree    != '' AND 
	PresentStatus != '' AND
	Organization != '' AND Organization != '-' AND Organization != '.'  AND 
    Designation != '' AND Designation != '.' AND 
	Location !=  '' AND location != ' ' ) ;

# --------------------------------------------------------------------------------------------------------------------# 
-- Q9. ANS : --- 
USE alumni ; 
CREATE VIEW college_b_hs_V AS (
SELECT * FROM college_b_hs 
WHERE 
	RollNo != '' AND 
    LastUpdate != '' AND 
    Name != '' AND 
    FatherName != '' AND 
    MotherName != ''  AND 
    Batch != '' AND 
    Degree    != '' AND 
    PresentStatus != '' AND 
	EntranceExam != ''  AND EntranceExam != '-' AND EntranceExam != '.' AND EntranceExam != '--' AND
    HSDegree != ''     AND 
    Institute != '' AND Institute != '.'   AND 
    Location != ''  AND Location != '.' ) ; 
# --------------------------------------------------------------------------------------------------------------------------# 
-- Q10 . ANS : -- 
USE alumni ;
CREATE VIEW college_b_se_v AS (
    SELECT * FROM college_b_se 
    WHERE 
		RollNo != '' AND 
		LastUpdate != '' AND 
		Name != '' AND 
		FatherName != '' AND 
		MotherName != ''  AND 
		Batch != '' AND 
		Degree    != '' AND 
		PresentStatus != '' AND
        Organization != '' AND Organization != '-' AND 
        Location !=  '') ;
# -----------------------------------------------------------------------------------------------------------------------------# 
-- Q11 . ANS : -- 
USE alumni ;
CREATE VIEW college_b_sj_V AS (
SELECT * FROM college_b_sj 
WHERE 
	RollNo != '' AND 
	LastUpdate != '' AND 
	Name != '' AND 
	FatherName != '' AND 
	MotherName != ''  AND 
	Batch != '' AND 
	Degree    != '' AND 
	PresentStatus != '' AND
	Organization != '' AND Organization != '-' AND Organization != '.'  AND 
    Designation != '' AND Designation != '.' AND 
	Location !=  '' AND location != ' ' ) ;
	
# ------------------------------------------------------------------------------------------------------------------------------------# 
-- Q12 .ANS : -- 
USE alumni;
-- For college_a_hs_v
DELIMITER | 
CREATE PROCEDURE college_a_hs_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_a_hs_v ;
END |
DELIMITER ;
-- For college_a_se_v 
DELIMITER | 
CREATE PROCEDURE college_a_se_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_a_se_v ;
END |
DELIMITER ;
-- For college_a_sj_v 
DELIMITER | 
CREATE PROCEDURE college_a_sj_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_a_sj_v ;
END |
DELIMITER ;
-- For college_b_hs_p 
DELIMITER | 
CREATE PROCEDURE college_b_hs_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_b_hs_v ;
END |
DELIMITER ;
-- For college_b_se 
DELIMITER | 
CREATE PROCEDURE college_b_se_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_b_se_v ;
END |
DELIMITER ;
-- For college_b_sj 
DELIMITER | 
CREATE PROCEDURE college_b_sj_p() 
BEGIN 
SELECT LOWER(Name) AS Name  , LOWER(FatherName) AS FatherName  , LOWER(MotherName)  AS MotherName
FROM  college_b_sj_v ;
END |
DELIMITER ;
-- Calling the procedures : 
CALL college_a_hs_p() ;
CALL college_a_se_p() ;
CALL college_a_sj_p() ;
CALL college_b_hs_p() ;
CALL college_b_se_p() ;
CALL college_b_sj_p() ;

# -------------------------------------------------------------------------------------------------------------------------------------------------------------# 
-- Q13.ANS : -- 
-- Answer is in excel file 

# - -----------------------------------------------------------------------------------------------------------------------------------------------------------# 
USE alumni ;
DELIMITER | 
CREATE PROCEDURE get_name() 
BEGIN 
SELECT Name FROM college_a_hs 
UNION 
SELECT Name FROM college_a_se 
UNION 
SELECT Name FROM college_a_sj ;
END | 
DELIMITER ; 

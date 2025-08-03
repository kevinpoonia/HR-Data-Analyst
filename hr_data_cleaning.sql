SELECT * FROM HRDA.human_resource;

USE HRDA;

#DATA CLEANING!


#change the column name MyUnknownColumn to index_column from human_resoruce table 

ALTER TABLE human_resource
RENAME COLUMN MyUnknownColumn TO index_column;

# Chnage the column id name to emp_id

ALTER TABLE human_resource
RENAME COLUMN id TO emp_id;

#Check the Datatypes for all the columns in human_resoruce table 
DESCRIBE human_resource;

#change the birthdate datatype from text to date and also corret the formating to yyyy-mm-dd

SELECT birthdate
FROM human_resource;

#before I update the data I turned off the security feature

SET sql_safe_updates = 0; 

UPDATE human_resource
SET birthdate =
CASE
	WHEN birthdate LIKE "%/%" THEN date_format(str_to_date(birthdate, "%m/%d/%Y"),"%Y-%m-%d")
    WHEN birthdate LIKE "%-%" THEN date_format(str_to_date(birthdate, "%m-%d-%Y"),"%Y-%m-%d")
    ELSE NULL
END;

#The birthdate column is still text. I will modify the dataype to date

ALTER TABLE human_resource
MODIFY COLUMN birthdate DATE;

DESCRIBE human_resource;

# Let's check hire date column

SELECT hire_date
FROM human_resource;

#Just like the birthdate I will clean up the hire_date rows and set the data type to date

UPDATE human_resource
SET hire_date =
CASE
	WHEN hire_date LIKE "%/%" THEN date_format(str_to_date(hire_date,"%m/%d/%Y"),"%Y-%m-%d")
    WHEN hire_date LIKE "-" THEN date_format(str_to_date(hire_date,"%m-%d-%Y"),"%Y-%m-%d")
    ELSE NULL
END;

ALTER TABLE human_resource
MODIFY COLUMN hire_date DATE;

DESCRIBE human_resource;

select termdate
FROM human_resource;


UPDATE human_resource
SET termdate = DATE(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

ALTER TABLE human_resource
MODIFY COLUMN termdate DATE;

#Insert column call age

ALTER TABLE human_resource
ADD COLUMN age INT;

UPDATE human_resource
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT birthdate,age
FROM human_resource;





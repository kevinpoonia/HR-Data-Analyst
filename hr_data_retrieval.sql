-- QUESTIONS

SELECT *
FROM human_resource;


-- 1. What is the gender breakdown of employees in the company?
SELECT gender, count(gender) as gender_count
FROM human_resource
WHERE age >= 18 AND termdate = "0000-00-00"
GROUP BY gender;
 


-- 2. What is the race/ethnicity breakdown of employees in the company?

SELECT race, count(race) as race_count
FROM human_resource
WHERE age >= 18 AND termdate = "0000-00-00"
GROUP BY race
ORDER BY race_count DESC;

-- 3. What is the age distribution of employees in the company?

SELECT 
CASE
	WHEN age >= 18 and age <= 24 THEN '18-24'
    WHEN age >= 25 and age <= 34 THEN '25-34'
    WHEN age >= 35 and age <= 44 THEN '35-44'
    WHEN age >= 45 and age <= 54 THEN '45-54'
    WHEN age >= 55 and age <= 64 THEN '55-64'
    ELSE '65+'
END AS age_group,
count(age) as age_count
FROM human_resource
WHERE age >= 18 and termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;




-- 4. How many employees work at headquarters versus remote locations?

SELECT location, count(location) as count
FROM human_resource
WHERE age >= 18 AND termdate = "0000-00-00"
GROUP BY location;


-- 5. What is the average length of employment for employees who have been terminated?

#date diff function help subtract the date and divide by 365 to get years
SELECT ROUND(AVG(DATEDIFF(termdate, hire_date)) / 365, 0) AS Average_length_employment
FROM human_resource
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00' AND age >= 18;


-- 6. How does the gender distribution vary across departments and job titles?

SELECT department, gender, count(gender) as gender_distribution
FROM human_resource
where age >= 18 and termdate = '0000-00-00'
GROUP BY department, gender
ORDER BY department;


-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, count(jobtitle) as job_title_distribution
FROM human_resource
WHERE age >= 18 and termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle;




-- 8. Which department has the highest turnover rate?

SELECT department, COUNT(*) as total_count, 
    SUM(CASE WHEN termdate <= CURDATE() AND termdate <> '0000-00-00' THEN 1 ELSE 0 END) as terminated_count, 
    SUM(CASE WHEN termdate = '0000-00-00' THEN 1 ELSE 0 END) as active_count,
    (SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) / COUNT(*)) as termination_rate
FROM human_resource
WHERE age >= 18
GROUP BY department
ORDER BY termination_rate DESC;



-- 9. What is the distribution of employees across locations state?

SELECT location_state,count(emp_id) as people_distribution
FROM human_resource
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location_state;




-- 10. How has the company's employee count changed over time based on hire and term dates?
 SELECT 
    YEAR(hire_date) AS year, 
    COUNT(*) AS hires, 
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations, 
    COUNT(*) - SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS net_change,
    ROUND(((COUNT(*) - SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END)) / COUNT(*) * 100),2) AS net_change_percent
FROM human_resource
WHERE age >= 18
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date) ASC;




-- 11. What is the tenure distribution for each department?
SELECT department, round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
FROM human_resource
WHERE age >= 18 and termdate <> '0000-00-00' and termdate <= curdate()
Group BY department;
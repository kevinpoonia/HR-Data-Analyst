## Project Description

<img width="1133" alt="Screen Shot 2023-06-04 at 5 43 48 PM" src="https://github.com/Pruthvik16/Data-Analyst-Project/assets/133834420/d6d391fd-265e-4795-9d96-0d2f30116e48">







This project involves the analysis of HR data spanning from the year 2000 to 2020, containing over 22,000 rows. The data was cleaned and analyzed using MySQL and visualized using PowerBI. The project aims to answer various questions related to employee demographics, distribution, turnover, and tenure within the company.





### Data Used
- HR Data with over 22,000 rows from the year 2000 to 2020.

### Tools and Technologies Used
- Data Cleaning & Analysis: MySQL
- Data Visualization: PowerBI

### Questions Addressed
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and termination dates?
11. What is the tenure distribution for each department?

### Summary of Findings
- There are more male employees.
- White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
- The youngest employee is 20 years old and the oldest is 57 years old.
- A large number of employees work at the headquarters versus remotely.
- The average length of employment for terminated employees is around 7 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The Marketing department has the highest turnover rate followed by Training. The least turnover rate is in the Research and Development, Support, and Legal departments.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.
- The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

### Limitations
- Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
- Some termination dates were far into the future and were not included in the analysis (1599 records). The only termination dates used were those less than or equal to the current date.

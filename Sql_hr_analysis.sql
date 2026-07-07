create database Hr_attrition_analysis;

CREATE TABLE employeeattrition (
    EmployeeID VARCHAR(20),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    JobRole VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    MonthlyIncome NUMERIC,
    YearsAtCompany INT,
    OverTime VARCHAR(10),
    JobSatisfaction NUMERIC,
    WorkLifeBalance NUMERIC,
    EnvironmentSatisfaction NUMERIC,
    DistanceFromHome INT,
    MaritalStatus VARCHAR(20),
    Attrition VARCHAR(10)
);

SELECT COUNT(*)
FROM employeeattrition;

SELECT *
FROM employeeattrition
LIMIT 10;

SELECT *
FROM employeeattrition
WHERE jobsatisfaction IS NULL
OR worklifebalance IS NULL;

SELECT COUNT(*) AS total_employees
FROM employeeattrition;

SELECT gender,
COUNT(*) AS employee_count
FROM employeeattrition
GROUP BY gender;

SELECT department,
COUNT(*) AS employee_count
FROM employeeattrition
GROUP BY department
ORDER BY employee_count DESC;

SELECT jobrole,
COUNT(*) AS employee_count
FROM employeeattrition
GROUP BY jobrole
ORDER BY employee_count DESC;

SELECT COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes';

SELECT COUNT(*) AS employees_stayed
FROM employeeattrition
WHERE attrition='No';

SELECT
ROUND(COUNT(CASE WHEN attrition='Yes' THEN 1 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employeeattrition;

SELECT department,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY department
ORDER BY employees_left DESC;

SELECT jobrole,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY jobrole
ORDER BY employees_left DESC;

SELECT overtime,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY overtime;

SELECT jobsatisfaction,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction;

SELECT worklifebalance,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY worklifebalance
ORDER BY worklifebalance;

SELECT environmentsatisfaction,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY environmentsatisfaction
ORDER BY environmentsatisfaction;

SELECT
ROUND(AVG(monthlyincome),2) AS avg_income_left
FROM employeeattrition
WHERE attrition='Yes';

SELECT
CASE
WHEN monthlyincome < 5000 THEN 'Low Income'
WHEN monthlyincome BETWEEN 5000 AND 10000 THEN 'Medium Income'
ELSE 'High Income'
END AS salary_band,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY salary_band;

SELECT yearsatcompany,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY yearsatcompany
ORDER BY yearsatcompany;

SELECT
CASE
WHEN distancefromhome <= 5 THEN 'Near'
WHEN distancefromhome <= 15 THEN 'Moderate'
ELSE 'Far'
END AS distance_category,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY distance_category;

SELECT maritalstatus,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY maritalstatus;

SELECT
CASE
WHEN age BETWEEN 18 AND 25 THEN '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END AS age_group,
COUNT(*) AS employees_left
FROM employeeattrition
WHERE attrition='Yes'
GROUP BY age_group;

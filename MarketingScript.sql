SELECT *
FROM marketingdata;

-- CUSTOMER SEGMENTATION; Analysis based on demographic information
SELECT job,SUM(balance) as Balance
FROM marketingdata
GROUP BY job
ORDER BY Balance DESC; 

SELECT marital, SUM(balance) as Balance
FROM marketingdata
GROUP BY marital
ORDER BY Balance DESC; 

SELECT education, SUM(balance) as Balance
FROM marketingdata
GROUP BY education
ORDER BY Balance DESC;

-- RISK ASSESSMENT; How many people have defaulted / not defaulted
SELECT housing, COUNT(housing) as Count
FROM marketingdata
GROUP BY  housing;

SELECT loan, COUNT(loan) as Count
FROM marketingdata
GROUP BY loan;

SELECT COUNT(balance) as Count
FROM marketingdata
WHERE balance > 2000;

-- maximum balance
SELECT MAX(balance) as MAX
FROM marketingdata;

-- minimum balance
SELECT MIN(balance) as MIN
FROM marketingdata;

-- average balance
SELECT ROUND(AVG(balance),2) as avg_bal
FROM marketingdata;

-- Percentage of the management under 30
SELECT ROUND((COUNT(*) / 
      (SELECT COUNT(*)
      FROM marketingdata 
      WHERE job = "management")) * 100,2) AS percentage_under_30
FROM marketingdata
WHERE job = "management" AND age < 30;

-- correlation betwen job title and education
SELECT job, education, COUNT(*) as correlation_count
FROM marketingdata
GROUP BY job, education
ORDER BY correlation_count DESC;

-- rate of non-management roles that have a loan
SELECT ROUND((COUNT(*) / 
       (SELECT COUNT(*)
       FROM marketingdata
       WHERE job != "management")) * 100, 2) as rate_of_non_management_with_loan
FROM marketingdata
WHERE  job != "management" AND loan = "Yes"; 

-- month with the highest number of campaigns
SELECT month AS month_with_the_highest_campaigns
FROM marketingdata
ORDER BY campaign DESC
LIMIT 1;
       
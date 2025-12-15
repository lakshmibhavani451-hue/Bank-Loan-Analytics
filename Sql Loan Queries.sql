create database bankingschema;
use bankingschema;
SELECT * FROM bankingschema.bankanalyticscleaned;
#Q1)
SELECT SUM(`Loan Amount`) AS total_loan_amount_funded FROM bankanalyticscleaned;
#Q2)
SELECT COUNT(`Loan Amount`) AS total_loans FROM bankanalyticscleaned;
#Q3)
SELECT SUM(`Total Pymnt`) AS total_collection FROM bankanalyticscleaned;
#Q4)
SELECT SUM(`Total Pymnt` - `Funded Amount`) AS total_interest FROM bankanalyticscleaned;
#Q5)
SELECT 
    `Branch Name`,
    SUM(`Funded Amount`) AS total_funded,
    SUM(`Total Pymnt`) AS total_collection,
    SUM(`Total Pymnt` - `Funded Amount`) AS total_interest
FROM bankanalyticscleaned
GROUP BY `Branch Name`
ORDER BY total_collection DESC;
#Q6)
SELECT 
    `State Name`,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY `State Name`
ORDER BY total_funded DESC;
#Q7)
SELECT 
    Religion,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY Religion
ORDER BY total_funded DESC;
#Q8)
SELECT 
    `Product Code`,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY `Product Code`
ORDER BY total_funded DESC;
#Q9)
SELECT 
    YEAR(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y')) AS month,
    SUM(`Funded Amount`) AS total_disbursed
FROM bankanalyticscleaned
GROUP BY year, month
ORDER BY year, month;
#Q10)
SELECT 
    Grade,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY Grade
ORDER BY total_funded DESC;
#Q11)
SELECT COUNT(*) AS default_loan_count
FROM bankanalyticscleaned
WHERE `Is Default Loan` = 'Y';
#Q12)
SELECT COUNT(DISTINCT `Client id`) AS delinquent_client_count
FROM bankanalyticscleaned
WHERE `Is Delinquent Loan` = 'Y';
#Q13)
SELECT 
    (SUM(CASE WHEN `Is Delinquent Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS delinquent_loan_rate
FROM bankanalyticscleaned;
#Q14)
SELECT 
    (SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS default_loan_rate
FROM bankanalyticscleaned;
#Q15)
SELECT 
    `Loan Status`,
    COUNT(*) AS loan_count,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY `Loan Status`
ORDER BY total_funded DESC;
#Q16)
SELECT 
    CASE 
        WHEN CAST(Age AS UNSIGNED) < 25 THEN 'Below 25'
        WHEN CAST(Age AS UNSIGNED) BETWEEN 25 AND 35 THEN '25-35'
        WHEN CAST(Age AS UNSIGNED) BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Above 50'
    END AS age_group,
    SUM(`Funded Amount`) AS total_funded
FROM bankanalyticscleaned
GROUP BY age_group;
#Q17)
SELECT 
    `Client id`,
    `Loan Amount`,
    `Disbursement Date (Years)` AS loan_duration_years
FROM bankanalyticscleaned;
#Q18)
SELECT COUNT(*) AS no_verified_loans
FROM bankanalyticscleaned
WHERE `Verification Status` = 'Not Verified';
















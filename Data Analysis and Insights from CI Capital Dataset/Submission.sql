-- Query 1: 
SELECT DISTINCT loan_type FROM CI_customer;

-- Query 2: 
SELECT loan_type, Count(*) AS Number_of_loans FROM CI_customer GROUP BY loan_type;

-- Query 3: 
SELECT * FROM CI_customer WHERE age < 30;

-- Query 4: 
SELECT loan_type, Count(account_no) AS count_of_loans FROM CI_loan WHERE credit_score < 580 GROUP BY loan_type;

SELECT * FROM ci_loan WHERE credit_score < 580 AND loan_type = "hl" ORDER BY credit_score;

-- Query 5: 
SELECT b.if_default, Avg(annual_income) AS Average_annual_income FROM CI_customer a INNER JOIN CI_loan b ON a.account_no = b.account_no WHERE b.credit_score > 700 GROUP BY b.if_default;

-- Query 6: 
SELECT a.marital_status, Avg(b.credit_score) AS Average_credit_Score FROM CI_customer a INNER JOIN CI_loan b ON a.account_no = b.account_no GROUP BY a.marital_status;

-- Query 7: 
SELECT a.education_level, Sum(b.if_default) as default_count FROM CI_customer a INNER JOIN CI_loan b ON a.account_no = b.account_no GROUP BY a.education_level HAVING default_count >= 5;

-- Query 8: 
SELECT a.report_month, a.real_gdp_in_lakh_crore, a.unemp_rate, Count(b.account_no) AS count_of_loans FROM CI_economics a LEFT JOIN CI_loan b ON Year(a.report_month) = Year(b.start_date) AND Month(a.report_month) = Month(b.start_date) GROUP BY a.report_month, a.real_gdp_in_lakh_crore, a.unemp_rate ORDER BY a.unemp_rate ASC;

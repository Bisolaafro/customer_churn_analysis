/*
  Predicting the likelihood of churn based on a combination of tenure and monthly 
  charges.
*/


-- Analysis for prediction of risk to churn based on tenure and monthly charge
WITH tenure_charge_averages AS  (WITH tenure_charge_churn AS (SELECT 
    tenure,
    MonthlyCharges,
    churn
  FROM 
    customer_info
  WHERE churn = 'Yes'
  ORDER BY 
    monthlycharges, tenure)

  SELECT
    tenure,
    COUNT(tenure) AS tenure_count,
    AVG(monthlycharges) AS average_monthly_charge
  FROM tenure_charge_churn
  GROUP BY
    tenure
  ORDER BY
    tenure, tenure_count DESC)
SELECT
  '1-10_months' AS tenure_length,
  ROUND(AVG(average_monthly_charge), 3 )AS avg_monthly_charge,
  ROUND(MIN(average_monthly_charge), 3) AS min_monthly_charge,
  ROUND(MAX(average_monthly_charge), 3) AS max_monthly_charge
FROM
  tenure_charge_averages
WHERE
  tenure <= 10

UNION

SELECT
  '11-25_months' AS tenure_length,
  ROUND(AVG(average_monthly_charge), 3 ) AS avg_monthly_charge,
  ROUND(MIN(average_monthly_charge), 3) AS min_monthly_charge,
  ROUND(MAX(average_monthly_charge), 3) AS max_monthly_charge
FROM
  tenure_charge_averages
WHERE
  tenure BETWEEN 11 AND 25

UNION

SELECT
  '26-44_months' AS tenure_length,
  ROUND(AVG(average_monthly_charge), 3 ) AS avg_monthly_charge,
  ROUND(MIN(average_monthly_charge), 3) AS min_monthly_charge,
  ROUND(MAX(average_monthly_charge), 3) AS max_monthly_charge
FROM
  tenure_charge_averages
WHERE
  tenure BETWEEN 26 AND 44;




-- Likelihood of a customer with a specific tenure and montly charge to churn
-- Based on the earlier analysis
SELECT 
  tenure,
  MonthlyCharges,
  churn,
  CASE 
    WHEN churn = 'Yes' THEN 'Likely to churn'
    WHEN tenure <= 10 AND MonthlyCharges > 71 THEN 'High Risk'
    WHEN tenure <= 25 AND MonthlyCharges BETWEEN 58 AND 89 THEN 'Moderate Risk'
    ELSE 'Low Risk'
  END AS churn_risk
FROM 
    customer_info
ORDER BY 
    churn_risk DESC, tenure DESC, MonthlyCharges DESC;




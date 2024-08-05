/*
  What is the relationship between monthly charges and churn? 
  Do higher or lower charges impact churn rates?
*/

-- Finding what charges correlate with low, high, medium charges in the dataset
SELECT
  MAX(monthlycharges) AS maximum_charge,
  MIN(monthlycharges) AS minimum_charge,
  AVG(monthlycharges) AS mean_charge,
  PERCENTILE_DISC(0.25) WITHIN group (ORDER BY monthlycharges) AS percentile_25,
  PERCENTILE_DISC(0.5) WITHIN group (ORDER BY monthlycharges) AS percentile_50,
  PERCENTILE_DISC(0.75) WITHIN group (ORDER BY monthlycharges) AS percentile_75
FROM customer_info;


-- Do different level of monthly charges affect churn rates?
SELECT 
  CASE 
    WHEN monthlycharges < 35.5 THEN 'Low'
    WHEN monthlycharges BETWEEN 35.5 AND 70.35 THEN 'Low-Medium'
    WHEN monthlycharges > 70.35 AND monthlycharges < 89.85 THEN 'Medium-High'
    ELSE 'High'
  END AS charge_group,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  charge_group
ORDER BY 
  churn_rate DESC;


/*
  What is the relationship between monthly charges and churn? 
  Do higher or lower charges impact churn rates?
*/

SELECT 
  contract, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  contract
ORDER BY 
  churn_rate DESC;


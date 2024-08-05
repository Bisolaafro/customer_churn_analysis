/*
  What is the overall churn rate
*/

SELECT
  'Yes' as churned,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS customers,
  ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 1.0 / COUNT(*), 3) AS rate
  
FROM
  customer_info

UNION
  SELECT
  'No' as churned,
  SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) AS customers,
  ROUND(SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END)* 1.0 / COUNT(*), 3) AS rate
  
FROM
  customer_info



/* 
  How does customer tenure impact churn rates? Are customers more likely to 
  churn early in their relationship or later?
*/

-- How does customer tenure affect churn?
SELECT 
  CASE 
    WHEN tenure <= 12 THEN '0-1 Year'
    WHEN tenure > 12 AND tenure <= 24 THEN '1-2 Years'
    ELSE '2+ Years'
  END AS tenure_group,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  tenure_group
ORDER BY 
  churn_rate DESC;

-- How do customer tenure and contract type affect churn?
SELECT
  contract,
  CASE 
    WHEN tenure <= 12 THEN '0-1 Year'
    WHEN tenure > 12 AND tenure <= 24 THEN '1-2 Years'
    ELSE '2+ Years'
  END AS tenure_group,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  tenure_group, contract
ORDER BY 
  churn_rate DESC;
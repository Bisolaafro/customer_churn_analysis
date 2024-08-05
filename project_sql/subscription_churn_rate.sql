/*
  How do streaming services impact churn? 
  Which services are associated with higher churn?
*/


-- How do streaming tv and/or streaming movies affect churn?
SELECT 
  streamingtv, streamingmovies, 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  streamingtv, streamingmovies
ORDER BY 
  churn_rate DESC;


-- How does streaming movies affect churn?
SELECT 
  streamingmovies, 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  streamingmovies
ORDER BY 
  churn_rate DESC;

-- How does streaming tc affect churn?
SELECT 
  streamingtv,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  streamingtv
ORDER BY 
  churn_rate DESC;



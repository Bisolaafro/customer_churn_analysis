/*
  What is the relationship between phone service, internet service and churn? 

*/

-- is there a correlation with having a phone and/or internet service and the churn rate?
SELECT 
  phoneservice, 
  internetservice, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  phoneservice, internetservice
ORDER BY 
  churn_rate DESC;


-- is there a correlation with having a phone service and the churn rate?
SELECT 
  phoneservice, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  phoneservice
ORDER BY 
  churn_rate DESC;


-- is there an correlation with having an internet service and the churn rate?
SELECT 
  internetservice, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  internetservice
ORDER BY 
  churn_rate DESC;




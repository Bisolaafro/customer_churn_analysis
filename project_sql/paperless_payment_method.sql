/*
  How do paperless billing and payment methods impact churn? 
  Are customers with certain payment methods more likely to churn?
*/

-- How do a customer's payment method and/or whether they use paperlessbilling 
-- affect churn rates?
SELECT 
  paperlessbilling,
  paymentmethod,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  paperlessbilling, paymentmethod
ORDER BY 
  churn_rate DESC;


-- How does a customer's payment method affect churn?
SELECT 
  paymentmethod, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  paymentmethod
ORDER BY 
  churn_rate DESC;


-- How does whether a customer users paperless billin affect churn?
SELECT 
  paperlessbilling, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  paperlessbilling
ORDER BY 
  churn_rate DESC;

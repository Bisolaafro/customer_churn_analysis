/*
  Do customers who subscribe to multiple services have different churn rates 
  compared to those who subscribe to fewer services?
*/

SELECT 
  (CASE WHEN phoneservice = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN multiplelines = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN internetservice != 'No' THEN 1 ELSE 0 END + 
  CASE WHEN onlinesecurity = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN onlinebackup = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN deviceprotection = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN techsupport = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN streamingtv = 'Yes' THEN 1 ELSE 0 END + 
  CASE WHEN streamingmovies = 'Yes' THEN 1 ELSE 0 END) AS service_count,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) *1.0 / COUNT(*)) * 100, 3) AS churn_rate
FROM 
  customer_info
GROUP BY 
  service_count
ORDER BY 
  service_count



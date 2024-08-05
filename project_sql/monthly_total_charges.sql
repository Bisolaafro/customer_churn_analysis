/*
  Is there a correlation between monthly charges and total charges, 
  and how does this relate to churn?
*/
SELECT 
  churn,
  AVG(monthlycharges) AS avg_monthly_charges,
  AVG(TotalCharges) AS avg_total_charges,
  (AVG(totalcharges) / AVG(monthlycharges)) AS avg_tenure_based_on_charges
FROM 
  customer_info
GROUP BY 
  churn
ORDER BY 
  avg_total_charges DESC;

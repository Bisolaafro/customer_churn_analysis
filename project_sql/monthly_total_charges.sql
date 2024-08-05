/*
  Is there a correlation between monthly charges and total charges, 
  and how does this relate to churn?
*/
SELECT 
  churn,
  ROUND(AVG(monthlycharges), 3 )AS avg_monthly_charges,
  ROUND(AVG(TotalCharges), 3 )AS avg_total_charges,
  ROUND((AVG(totalcharges) / AVG(monthlycharges)), 3 )AS avg_tenure_based_on_charges
FROM 
  customer_info
GROUP BY 
  churn
ORDER BY 
  avg_total_charges DESC;

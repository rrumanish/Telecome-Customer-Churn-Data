create database MajorProject;

use majorproject;
Select	* from customer_churn_dataset;
#What are the primary factors influencing customer churn? Are there any specific patterns or correlations in the data that indicate churn-prone customers?
# Count of churned customers by factors
SELECT
  gender,marital_status,dependents,
  contract_type,internet_service,phone_service,
  multiple_lines,online_security,online_backup,
  device_protection,tech_support,streaming_tv,
  streaming_movies,
  COUNT(*) as churn_count
 from customer_churn_dataset
 WHERE churn_status='Yes'
 GROUP BY
  gender,marital_status,dependents,
  contract_type,internet_service,phone_service,
  multiple_lines,online_security,online_backup,
  device_protection,tech_support,streaming_tv,
  streaming_movies;
  
#Can we identify any demographic or behavioral characteristics that differentiate churned customers from those who continue to be active?
 SELECT 
    gender,
    marital_status,
    dependents,
    churn_status,
    AVG(age) AS avg_age,
    AVG(monthly_charges) AS avg_monthly_charges,
    AVG(total_charges) AS avg_total_charges,
    COUNT(churn_status) AS customer_churn_count
FROM
    customer_churn_dataset
GROUP BY gender , marital_status , dependents , churn_status
ORDER BY gender , marital_status , dependents , churn_status;
  
 #Are there any specific services or contract terms that contribute significantly to customer churn? Are there opportunities to modify or enhance these offerings to reduce churn?
 SELECT
  contract_type,internet_service,phone_service,
  multiple_lines,online_security,online_backup,
  device_protection,tech_support,streaming_tv,
  streaming_movies,
  COUNT(*) as churn_count
 from customer_churn_dataset
 WHERE churn_status='Yes'
 GROUP BY
 contract_type,internet_service,phone_service,
  multiple_lines,online_security,online_backup,
  device_protection,tech_support,streaming_tv,
  streaming_movies;
  
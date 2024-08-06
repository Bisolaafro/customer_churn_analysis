### Telco Customer Churn Analysis Project

#### **Project Overview**
The Telco Customer Churn Analysis project aims to analyze customer churn patterns using a real-world dataset from a telecommunications company. The primary objective is to identify key factors contributing to customer churn and develop insights that can help in devising strategies to reduce churn rates. The project involves data cleaning, exploratory data analysis (EDA), visualization, and predictive modeling using various tools and techniques.

#### **Tools and Technologies Used**
- **Python:** The main programming language used for data manipulation, analysis, and visualization.
  - **Pandas:** For data cleaning, processing, and manipulation.
  - **NumPy:** For numerical operations and handling arrays.
  - **Matplotlib:** For data visualization to identify patterns and trends in the dataset.
  - **3D Plotting (mpl_toolkits.mplot3d):** Used for advanced visualizations to explore multi-dimensional data relationships.
- **SQL:** For extracting and querying data to visualize
- **Jupyter Notebook:** For interactive coding, documentation, and visualization in an organized format.

#### **Project Workflow**
1. **Data Collection and Loading:**
   - The dataset was obtained in CSV format, containing customer information, service details, account information, and churn status.
   - The data was loaded into a PostgreSQL for structured querying and into a Pandas DataFrame for processing in Python.

2. **Data Cleaning:**
   - Handled missing values, corrected data types, and removed duplicates to ensure data quality.
   - Processed categorical variables and transformed them for analysis.

3. **Exploratory Data Analysis (EDA):**
   - Analyzed customer demographics, service usage, and account details to identify trends and patterns.
   - Visualized key metrics such as churn rate across different services, contract types, and payment methods.
   - Used SQL to perform complex queries and aggregations for deeper insights.

4. **Data Visualization:**
   - Created 2D and 3D bar plots to visualize the relationship between churn and other variables like monthly charges, tenure, and contract type.
   - Used matplotlib for standard plots and `mpl_toolkits.mplot3d` for 3D visualizations to better understand multi-dimensional relationships.

5. **Predictive Modeling:**
   - Built machine learning models to predict customer churn based on various features in the dataset.
   - Evaluated model performance using metrics such as accuracy, precision, recall, and ROC-AUC score.

6. **Insights and Recommendations:**
   - Identified that customers with month-to-month contracts and higher monthly charges were more likely to churn.
   - Noticed that customers who had longer tenure and lower monthly charges tended to stay longer with the service.
   - Suggested offering discounts or loyalty programs for customers at high risk of churning to improve retention.

Based on the comprehensive analysis of various factors influencing customer churn, here are the updated key insights:

### Key Insights

1. **Churn Rate Analysis**:
   - **Contract Type**: Higher churn rates were observed among customers with month-to-month contracts compared to those with one-year or two-year contracts. Two-year contracts had the lowest churn rates, indicating higher customer retention and satisfaction.
   - **Paperless Billing**: Customers using paperless billing had higher churn rates compared to those using traditional billing methods, suggesting potential dissatisfaction with the paperless billing process.

2. **Impact of Monthly Charges**:
   - **Higher Monthly Charges**: Customers with higher monthly charges were more likely to churn, indicating that cost-sensitive customers are at higher risk. This was particularly evident in the medium-high and high charge groups.
   - **Charge Groups**: Customers in the low charge group had the lowest churn rates, suggesting that lower charges are associated with higher customer retention.

3. **Tenure and Loyalty**:
   - **Longer Tenure**: Longer tenure was associated with lower churn rates, indicating that long-term customers have a lower propensity to leave. Customers with a tenure of more than two years had the lowest churn rates.
   - **New Customers**: Customers in their first year had the highest churn rates, highlighting the importance of improving initial customer satisfaction and onboarding processes.

4. **Service Usage**:
   - **Number of Services**: Customers using three services had the highest churn rates, while those using nine services had the lowest churn rates. This suggests that offering a comprehensive range of services can improve customer retention.
   - **Streaming Services**: Customers with both streaming TV and streaming movies had lower churn rates compared to those without these services, indicating that offering streaming services can enhance customer satisfaction.

5. **Payment Methods**:
   - **Electronic Check**: This payment method had the highest churn rates, suggesting dissatisfaction or issues with electronic check payments.
   - **Automatic Payments**: Customers using automatic bank transfers or credit card payments had lower churn rates, indicating higher satisfaction with these payment methods.

6. **Demographic Factors**:
   - **Gender**: Both Females and Males had very similar churn rates indicating that there is likely no association between gender and churn rates.
   - **Partner Status**: Customers without a partner had higher churn rates, indicating that having a partner might be a stabilizing factor.
   - **Dependents**: Customers without dependents had higher churn rates, suggesting that having dependents might contribute to customer retention.


#### **Conclusion**
This project provided valuable insights into customer behavior and churn patterns for a telecommunications company. By leveraging SQL for data extraction and insights and Python for in-depth analysis and modeling, we could identify actionable strategies to mitigate churn and enhance customer retention.

This analysis serves as a foundation for further investigations and can be extended by incorporating more advanced machine learning models and additional customer data for even deeper insights.
[View Analysis](visualizations.ipynb)

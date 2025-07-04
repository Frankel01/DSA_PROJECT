# DSA_PROJECT

# Kultra Mega Stores Inventory (SQL PROJECT)

### PROJECT OVERVIEW
--- 
Kultra Mega Stores specialises in office supplies and furniture. Its customer base includes individual consumers, small businesses (retail), and large corporate clients (wholesale) across three states in Nigeria. I was task to support the Abuja division. The Business Manager shared a dataset containing order data from 2009 to 2012 and has requested that i analyze the data and present key insights and findings.

### Data Source
The dataset was sourced from (Digital Skillup Afria) Incubator Hub, Nigeria

### Method and Tools
---
Data Cleaning: Performed using Microsoft Excel to remove errors and prepare the dataset. checked for some NULL values and made sure the dataset was ready for exploration.

Data Exploration: SQL queries were written and executed using SQL Server Management Studio (SSMS) to better understand data distributions and relationships.

Github: For portifolio building.

### Exploratory Data Analysis
-- Which product category had the highest sales?
``` SQL
SELECT Product_Category, 
Count(Order_ID) as Frequency_of_Purchase,
Round(SUM(Sales), 2) AS Hightest_Bought
From KMS_Case_Study
Group BY Product_Category
Order By Hightest_Bought DESC;

--- Findings: The Technology category has the highest purchase and more purchase frequnecy.
```
----What are the Top 3 and Bottom 3 regions in terms of sales?
``` SQL
SELECT TOP 3
Region, Round(SUM(Sales), 00) AS TotalSales
From KMS_Case_Study
Group By Region
Order By TotalSales DESC;

SELECT TOP 3
Region, Round(SUM(Sales), 00) AS TotalSales
From KMS_Case_Study
Group By Region
Order By TotalSales ASC;

--- The West has te hightest sale by region while the Nunavut has the lowest sales by region.
```
-----What were the total sales of appliances in Ontario?
``` SQL
SELECT Count(*) as Count_of_sales,
Round(SUM(Sales), 00) 
AS Total_Sales_In_Ontario
FROM KMS_Case_Study
WHERE Product_Sub_Category = 'Appliances' 
AND Region = 'Ontario'
Group By Product_Sub_Category,
Region;
---
```

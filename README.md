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
---
1. Which product category had the highest sales?
``` SQL
SELECT Product_Category, 
Count(Order_ID) as Frequency_of_Purchase,
Round(SUM(Sales), 2) AS Hightest_Bought
From KMS_Case_Study
Group BY Product_Category
Order By Hightest_Bought DESC;

--- Findings: The Technology category has the highest purchase and more purchase frequnecy.
```
2. What are the Top 3 and Bottom 3 regions in terms of sales?
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
3. What were the total sales of appliances in Ontario?
``` SQL
SELECT Count(*) as Count_of_sales,
Round(SUM(Sales), 00) 
AS Total_Sales_In_Ontario
FROM KMS_Case_Study
WHERE Product_Sub_Category = 'Appliances' 
AND Region = 'Ontario'
Group By Product_Sub_Category,
Region;

--- The total sales for appliances in Ontario is 202347
```
4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
``` SQL
SELECT TOP 10
Order_ID, Customer_Name, 
SUM(Sales) AS TotalSales
FROM KMS_Case_Study
Group By Order_ID, Customer_Name
Order By
TotalSales ASC;

--- There should be provision for discount programs to encourage more purchase from these customers
```
5. KMS incurred the most shipping cost using which shipping method?
``` SQL
SELECT Ship_Mode, Round(SUM(Shipping_Cost), 2) 
AS Total_Shipping_Cost
FROM KMS_Case_Study
Group By Ship_Mode
Order By Total_Shipping_Cost DESC;

--- Kultra Mega Stores incurred more cost using the Delivery Truck shipping method
```
6. Who are the most valuable customers, and what products or services do they typically purchase?
``` SQL
SELECT TOP 10
Customer_Name, Count(*) AS Count_of_Purchase,
Product_Sub_Category
FROM KMS_Case_Study
Group By Customer_Name, Product_Sub_Category
Order By
Count_of_Purchase DESC;

--- The most valuables customers purchases Staples and Eldon 500 Class Desk Accessories
```
7. Which small business customer had the highest sales?
``` SQL
SELECT TOP 1
Customer_Name,
ROUND(SUM(Sales), 2) AS TotalSales
FROM KMS_Case_Study
WHERE Customer_Segment = 'Small Business'
Group By Customer_Name
Order By
TotalSales DESC;

--- The Small buisness owner with the hightest sales is (Dennis Kane) with 75967.59
```
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
``` SQL
SELECT TOP 1
Customer_Name, Count(Order_Quantity) AS Count_of_Quantity
From KMS_Case_Study
WHERE Customer_Segment = 'Corporate' 
AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
Group By Customer_Name
Order By Count_of_Quantity DESC;

---- The Corporate Customer with the highest order is Adam Hart with 27 Orders
```
9. Which consumer customer was the most profitable one?
``` SQL
SELECT TOP 1
Customer_Name, ROUND(SUM(Profit), 2) AS Total_Profit
FROM KMS_Case_Study
WHERE Customer_Segment = 'Consumer' 
Group By Customer_Name
Order By Total_Profit DESC;
--- The Most profit customer is Emily Phan with 34005.44 in profit
```
10. Which customer returned items, and what segment do they belong to?
``` SQL
SELECT 
Customer_Name,
Customer_Segment,
COUNT(*) AS Returned_Items,
SUM(Sales) AS Total_Returned_Sales
FROM KMS_Case_Study
WHERE Profit < 0
GROUP BY Customer_Name, Customer_Segment
ORDER BY Returned_Items DESC;

--- Those customer sbelong to Small business, Home office, Corporate and Consumer segments.
```
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, 
do you think the company appropriately spent shipping costs based on the Order Priority?
``` SQL
SELECT 
Order_Priority,
Ship_Mode,
COUNT(*) AS Num_Orders,
ROUND(SUM(Sales), 00) AS Total_Sales,
ROUND(SUM(Profit), 00) AS Total_Profit
FROM KMS_Case_Study
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;

--- The company did not appropriately spend shipping costs based on Order Priority.
-- Express Air, the most expensive shipping mode, was used for Low and Not Specified priority orders, 
--which contradicts cost-efficiency principles.Delivery Truck, the slowest method, was occasionally used for High or Critical orders.
-- The company did not consistently match shipping cost with urgency, suggesting potential inefficiencies in logistics planning.
```

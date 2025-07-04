CREATE DATABASE DSA_PROJECT

SELECT * FROM KMS_Case_Study

-----Which product category had the highest sales?
SELECT Product_Category, 
Count(Order_ID) as Frequency_of_Purchase,
Round(SUM(Sales), 2) AS Hightest_Bought
From KMS_Case_Study
Group BY Product_Category
Order By Hightest_Bought DESC;

----What are the Top 3 and Bottom 3 regions in terms of sales?
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

-----What were the total sales of appliances in Ontario?
SELECT Count(*) as Count_of_sales,
Round(SUM(Sales), 00) 
AS Total_Sales_In_Ontario
FROM KMS_Case_Study
WHERE Product_Sub_Category = 'Appliances' 
AND Region = 'Ontario'
Group By Product_Sub_Category,
Region;

----Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
SELECT TOP 10
Order_ID, Customer_Name, 
SUM(Sales) AS TotalSales
FROM KMS_Case_Study
Group By Order_ID, Customer_Name
Order By
TotalSales ASC;

---KMS incurred the most shipping cost using which shipping method?
SELECT Ship_Mode, Round(SUM(Shipping_Cost), 2) 
AS Total_Shipping_Cost
FROM KMS_Case_Study
Group By Ship_Mode
Order By Total_Shipping_Cost DESC;

----Who are the most valuable customers, and what products or services do they typically purchase?
SELECT TOP 10
Customer_Name, Count(*) AS Count_of_Purchase,
Product_Sub_Category
FROM KMS_Case_Study
Group By Customer_Name, Product_Sub_Category
Order By
Count_of_Purchase DESC;

-----Which small business customer had the highest sales?
SELECT TOP 10
Customer_Name,
ROUND(SUM(Sales), 2) AS TotalSales
FROM KMS_Case_Study
WHERE Customer_Segment = 'Small Business'
Group By Customer_Name
Order By
TotalSales DESC;

------Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 10
Customer_Name, Count(Order_Quantity) AS Count_of_Quantity
From KMS_Case_Study
WHERE Customer_Segment = 'Corporate' 
AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
Group By Customer_Name
Order By Count_of_Quantity DESC;

----Which consumer customer was the most profitable one?
SELECT TOP 10
Customer_Name, SUM(Profit) AS Total_Profit
FROM KMS_Case_Study
WHERE Customer_Segment = 'Consumer' 
Group By Customer_Name
Order By Total_Profit DESC;

----Which customer returned items, and what segment do they belong to?
SELECT
Customer_Name, Customer_Segment, 
SUM(Order_Quantity) AS Total_Quantity
FROM KMS_Case_Study
Group By Customer_Name, Customer_Segment
HAVING SUM(Order_Quantity) < 0
Order By Total_Quantity DESC;

---- If the delivery truck is the most economical but the slowest shipping method and Express Air is fastest,
--but the expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? 
--Explain your answer

SELECT 
Order_Priority,
Ship_Mode,
COUNT(*) AS Num_Orders,
ROUND(SUM(Sales), 00) AS Total_Sales,
ROUND(SUM(Profit), 00) AS Total_Profit
FROM KMS_Case_Study
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;

----Interpretation:

-- The company did not appropriately spend shipping costs based on Order Priority.
-- Express Air, the most expensive shipping mode, was used for Low and Not Specified priority orders, 
--which contradicts cost-efficiency principles.Delivery Truck, the slowest method, was occasionally used for High or Critical orders.
-- he company did not consistently match shipping cost with urgency, suggesting potential inefficiencies in logistics planning.

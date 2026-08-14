USE customer_analytics;
SELECT * FROM customers
LIMIT 2;

-- avg customer age
SELECT AVG(Age)
FROM customers;
 
 -- Year wise Spending analysis
 SELECT Year,SUM(Total_Spending) AS Spending_Year
 FROM customers
 GROUP BY Year;
 
--  avg customer income
SELECT AVG(Income) FROM customers;

-- Section A – Customer Demographics

-- Education distribution
SELECT Education,COUNT(*) as total_customers,
round(count(*)*100.0/(select count(*) from customers),2)as percentage_count,
round(avg(Total_Spending),2) as avg_spending
from customers
group by Education
ORDER BY total_customers DESC;

-- Marital status distribution
SELECT Marital_Status ,COUNT(*) AS total_customers,
round(count(*)*100/(select count(*) from customers),2)as percentage_count,
round(avg(Total_Spending),2)as avg_spending
from customers
group by Marital_Status
ORDER BY total_customers DESC;

-- Customers by age group
SELECT 
    age_group,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage_share,
    ROUND(AVG(Total_Spending), 2) AS avg_spending
FROM customers
GROUP BY age_group
ORDER BY total_customers DESC;

-- Section B – Spending Analysis
SELECT Total_Spending ,ID AS Highest_Spending_CustomerID
FROM customers
ORDER BY Total_Spending DESC
LIMIT 10;

-- Total revenue by product category
SELECT 'Wines' AS Product_Category, SUM(MntWines) AS Total_Revenue FROM customers
UNION ALL
SELECT 'Meat Products', SUM(MntMeatProducts) FROM customers
UNION ALL
SELECT 'Gold Products', SUM(MntGoldProds) FROM customers
UNION ALL
SELECT 'Fish Products', SUM(MntFishProducts) FROM customers
UNION ALL
SELECT 'Sweet Products', SUM(MntSweetProducts) FROM customers
UNION ALL
SELECT 'Fruits', SUM(MntFruits) FROM customers
ORDER BY Total_Revenue DESC;
-- Highest-selling product category-Wine
-- Lowest-selling product category-Fruits


-- Section C – Purchase Behavior
-- Which channel is most popular?

SELECT 'Website' AS Purchase_Channel, SUM(NumWebPurchases) AS Total_Purchase
FROM customers
UNION ALL
SELECT 'Store' ,SUM(NumStorePurchases) FROM customers
UNION ALL 
SELECT 'Catalog',SUM(NumCatalogPurchases) FROM customers
ORDER BY Total_Purchase DESC
LIMIT 1;
-- Store is the most popular purchase channel.


-- Average purchases by channel
SELECT 'Website' AS Purchase_Channel, ROUND(AVG(NumWebPurchases),2) AS Avg_Purchase_Per_Customer
FROM customers
UNION ALL
SELECT 'Store' ,ROUND(AVG(NumStorePurchases),2) FROM customers
UNION ALL 
SELECT 'Catalog',ROUND(AVG(NumCatalogPurchases),2) FROM customers
ORDER BY Avg_Purchase_Per_Customer DESC;


-- Customers with no web purchases
SELECT ID,Age,Education,Income,Total_Spending
FROM customers
WHERE NumWebPurchases=0
ORDER BY age;

SELECT COUNT(*) AS Customers_With_No_Web_Purchases
FROM customers
WHERE NumWebPurchases = 0;
-- There are 49 customer who do not purchase through web

SELECT COUNT(*) as Cus_Buy_only_Store
FROM customers
WHERE NumWebPurchases=0 and NumCatalogPurchases=0 and NumStorePurchases>1;
-- There are 28 Customer who purchase only through store

-- Section D – Campaign Performance
SELECT 'Campaign 1' AS Campaign,
       ROUND(AVG(AcceptedCmp1) * 100, 2) AS Acceptance_Rate
FROM customers
UNION ALL
SELECT 'Campaign 2',
       ROUND(AVG(AcceptedCmp2) * 100, 2)
FROM customers
UNION ALL
SELECT 'Campaign 3',
       ROUND(AVG(AcceptedCmp3) * 100, 2)
FROM customers
UNION ALL
SELECT 'Campaign 4',
       ROUND(AVG(AcceptedCmp4) * 100, 2)
FROM customers
UNION ALL
SELECT 'Campaign 5',
       ROUND(AVG(AcceptedCmp5) * 100, 2)
FROM customers
ORDER BY Acceptance_Rate DESC;
-- the Campaign 4 have more acceptance rate than other so we should apply the campaign 4 strategy for future campaign
-- Best Performing Campaign 4

-- Response rate by education
SELECT (COUNT(Response)*100)/(SELECT COUNT(Response) FROM customers) AS Response_Rate,Education
FROM customers
GROUP BY Education;

-- Response rate by Income Group
SELECT (COUNT(Response)*100)/(SELECT COUNT(Response) FROM customers) AS Response_Rate,income_group
FROM customers
GROUP BY income_group;

SELECT (COUNT(Response)*100)/(SELECT COUNT(Response) FROM customers) AS Response_Rate,age_group
FROM customers
GROUP BY age_group;

-- Section E – Customer Segmentation

-- High Value customers who spend and purchase more than average
SELECT ID,
       Total_Spending,
       Total_Purchase
FROM customers
WHERE Total_Spending > (
        SELECT AVG(Total_Spending)
        FROM customers
      )
AND Total_Purchase > (
        SELECT AVG(Total_Purchase)
        FROM customers
      );

SELECT ID,Total_Spending,
CASE
 WHEN Total_Spending >= 700 THEN 'High Value'
           WHEN Total_Spending >= 400 THEN 'Medium Value'
           ELSE 'Low Value'
           END AS customer_segment
FROM customers
ORDER BY Total_Spending DESC;

-- Inactive Customers
SELECT Education,
       COUNT(*) AS Inactive_Customers
FROM customers
WHERE Recency > 60
GROUP BY Education
ORDER BY Inactive_Customers DESC;
-- 448 Customers from  graduation education group is inactive from 60 days

-- customer Who never purchase
SELECT Education,
       COUNT(*) AS Customers_With_No_Purchases
FROM customers
WHERE Total_Purchase = 0
GROUP BY Education
ORDER BY Customers_With_No_Purchases DESC;

-- Loyal Customers
SELECT Education,
       COUNT(*) As Loyal_Customers
FROM customers
WHERE Recency < 10
GROUP BY Education
ORDER BY Loyal_Customers DESC;

-- Frequent Buyers
SELECT COUNT(*) AS Frequent_Buyers
FROM customers
WHERE Total_Purchase > (
        SELECT AVG(Total_Purchase)
        FROM customers
      );
      
-- Rank top customers by spending.
	SELECT ID,Education,Income,Total_Spending,
    RANK() OVER (ORDER BY Total_Spending DESC )AS spending_rank
    FROM customers
    ORDER BY spending_rank;
    
--     customers spending above the average.
SELECT ID,Education,Total_Spending
FROM customers
WHERE Total_Spending > (SELECT ROUND(AVG(Total_Spending),2) FROM customers) -- THE AVG Spending is 605.8
ORDER BY Total_Spending DESC;

-- Calculate cumulative spending.
SELECT ID,Total_Spending,
SUM(Total_Spending)
OVER(ORDER BY Total_Spending DESC,ID
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)AS Cumulative_Spending
FROM customers;
-- By default, MySQL uses a RANGE window frame. When there are duplicate values in the ORDER BY column,
--  all rows with the same value are processed together, giving them the same cumulative sum. 
-- Using ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW calculates the running total row by row, 
-- which is the expected behavior for cumulative totals.

-- Rank income within each education group.
SELECT ID,Income,Education,Total_Spending,
RANK() OVER(PARTITION BY Education ORDER BY Income DESC) AS Income_Rank
FROM customers
ORDER BY Education,Income_Rank;

SELECT
    Year,
    ROUND(SUM(Total_Spending),2) AS Total_Spending
FROM customers
GROUP BY Year
ORDER BY Total_Spending DESC ;
-- Year 2013 have highest spending of customers

SELECT
    Month,
    ROUND(SUM(Total_Spending),2) AS Total_Spending
FROM customers
GROUP BY Month
ORDER BY Total_Spending DESC ;
-- The August month have highest spending

SELECT
    Total_Children,
    ROUND(AVG(Total_Spending),2) AS Avg_Spending,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(Total_Spending),2) AS Total_Revenue
FROM customers
GROUP BY Total_Children
ORDER BY Total_Children;
-- 0 children has the highest total revenue, they are the most valuable segment overall 
-- Customers with one child represent the largest customer segment. Although their average spending is lower,
--  targeted promotions and cross-selling strategies could increase their spending and generate significant overall revenue.


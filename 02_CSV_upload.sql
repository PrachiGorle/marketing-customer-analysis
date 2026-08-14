USE customer_analytics;

-- 1. Clear out the empty/null rows
TRUNCATE TABLE customers;

-- 2. Load with semicolon delimiter
LOAD DATA LOCAL INFILE 'C:/Users/prach/OneDrive/Desktop/Marketing_Customer_Analytics/Data/Marketing_Cleaned.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','     -- Changed ',' to ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'   -- Or '\n'
IGNORE 1 LINES;

-- 3. Verify that data populates across all columns
SELECT * FROM customers LIMIT 10;
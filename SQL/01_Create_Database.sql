CREATE DATABASE marketing_analysis;

USE marketing_analysis;

USE marketing_analysis;

CREATE TABLE marketing_customers (
    ID INT PRIMARY KEY,
    Year_Birth INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(12,2),
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE,
    Recency INT,

    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,

    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,

    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    Response INT,
    Complain INT,

    Country VARCHAR(50),

    Month INT,
    Year INT,
    Day INT,
    Day_name VARCHAR(20),

    Age INT,
    Total_Children INT,
    Total_Spending INT,
    Total_Purchase INT,

    age_group VARCHAR(30),
    income_group VARCHAR(30)
);



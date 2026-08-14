# marketing-customer-analysis
# Marketing & Customer Analysis

An end-to-end Data Analytics project using Python, SQL and Power BI to analyze customer behavior, product spending, purchase channels and campaign performance.
![Python](https://img.shields.io/badge/Python-3.x-blue)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

## Business Problem

Businesses collect large amounts of customer and marketing data, but raw data alone does not explain:

- Which products generate the most spending?
- Which purchase channels are most popular?
- Which customer segments have higher spending?
- Which campaigns generate stronger customer responses?
- Which customers may require retention efforts?

This project analyzes customer marketing data to convert these questions into actionable business insights.

## Objectives

- Analyze customer demographics and purchasing behavior.
- Identify high-spending product categories.
- Compare Store, Web and Catalog purchasing channels.
- Analyze campaign responses.
- Identify differences in spending across customer segments.
- Build an interactive Power BI dashboard.
- Provide business recommendations based on the analysis.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and Exploratory Data Analysis |
| Pandas | Data manipulation |
| NumPy | Numerical analysis |
| SQL / MySQL | Business analysis and querying |
| Power BI | Dashboard and visualization |
| DAX | Measures and calculations |
| GitHub | Project documentation and version control |

## 📂 Dataset

The dataset contains customer-level marketing information including:

- Customer demographics
- Income and education
- Household characteristics
- Product spending
- Purchase channels
- Campaign responses
- Recency and purchasing activity

Key variables include:

`Education`, `Income`, `Recency`, `MntWines`, `MntMeatProducts`,
`MntFishProducts`, `MntSweetProducts`, `MntGoldProds`,
`NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`,
`AcceptedCmp1–5`, and `Response`.

## Project Workflow

Raw Dataset
      ↓
Data Cleaning
      ↓
Exploratory Data Analysis
      ↓
SQL Business Analysis
      ↓
Star Schema Modeling
      ↓
DAX Measures
      ↓
Power BI Dashboard
      ↓
Business Insights & Recommendations

## Data Cleaning & EDA

The dataset was cleaned and prepared for analysis by:

- Handling missing values.
- Correcting data types.
- Creating derived variables such as Age, Age Group and Income Group.
- Creating Total Spending and Total Purchase metrics.
- Extracting Month, Year, Day and Day Name from customer dates.
- Checking distributions and potential outliers.
- Analyzing relationships between customer characteristics and spending.

 ## SQL Analysis

SQL was used to answer business questions such as:

- Which education groups have the most customers?
- Which products generate the highest spending?
- Which purchase channel is most popular?
- What is the average purchase by channel?
- Which customers make no web purchases?
- Which customers purchase only in-store?
- What is the campaign response rate?
- Who are the high-value customers?
- Which customers are inactive?
- How are customers ranked by income within education groups?
- What is the cumulative customer spending?
- How does spending vary month-wise?

## Data Model

The Power BI model follows a star-schema structure:

Dim_Customer ─── Fact_Marketing ─── Dim_Campaign
                       │
                       │
                  Fact_Product
                       │
                  Dim_Product

Dim_Date → Fact_Marketing
Dimension tables provide descriptive customer, product, campaign and date information, while fact tables contain measurable purchasing and marketing activity.

## Power BI Dashboard

The dashboard consists of three analytical pages:

### 1️⃣ Marketing Performance Overview

Focuses on:
- Monthly spending trends
- Education-level spending
- Product spending
- Campaign responses
- Overall customer and purchase KPIs

![Marketing Overview](Dashboard/Marketing%20Overview.png)

### 2️⃣ Customer Analysis

Focuses on:

- Customer demographics
- Spending by number of children
- Spending by age group
- Spending by income group
- Education-level customer distribution
- Interactive customer filters

![Customer Analysis](Dashboard/Customer%20Analysis.png)

### 3️⃣ Product & Campaign Analysis

Focuses on:

- Store, Web and Catalog purchases
- Product contribution
- Campaign response comparison
- Purchase channel performance

![Product&Campaign](Dashboard/Product%26Campaign.png)

## Key Insights

- Wines contributed approximately **50.17%** of product spending, followed by Meat Products at **27.56%**.
- Store was the leading purchase channel with approximately **13K purchases**, followed by Website (9K) and Catalog (6K).
- Graduate customers recorded the highest spending among the education groups.
- Monthly spending reached its highest level in **August (~145K)** and its lowest level in **July (~50K)**.
- The most recent campaign generated the highest response count at approximately **334 responses**.
- Customer value varies across education, income, age, household characteristics, recency and purchasing behavior.

## Business Recommendations

### Product Strategy
Prioritize Wines and Meat Products through bundles, cross-selling and premium offers.
### Channel Strategy
Maintain strong Store engagement while developing personalized Website and Catalog campaigns.
### Campaign Strategy
Study the targeting strategy behind the strongest campaign responses and apply successful patterns to future campaigns.
### Customer Strategy
Identify high-value customers using spending and purchasing activity and prioritize them for loyalty and retention initiatives.
### Seasonal Strategy
Use monthly spending trends to plan promotions during low-spending periods and capitalize on high-demand periods.

## Future Scope

Future analysis could include:

- RFM customer segmentation.
- K-Means clustering.
- Customer churn prediction.
- Campaign response prediction.
- Customer Lifetime Value analysis.
- Segment-level campaign performance comparison.
- Automated Power BI refresh and reporting.

## Repository Contents

| Folder | Description |
|---|---|
| `data/` | Cleaned dataset |
| `sql/` | SQL analysis queries |
| `powerbi/` | Power BI dashboard |
| `dashboard/` | Dashboard screenshots |
| `documentation/` | Detailed project report |

## Conclusion

This project demonstrates an end-to-end data analytics workflow, transforming raw customer marketing data into actionable business insights using Python, SQL and Power BI.

The analysis helps identify important product categories, purchasing channels, customer segments and campaign response patterns that can support data-driven marketing decisions.

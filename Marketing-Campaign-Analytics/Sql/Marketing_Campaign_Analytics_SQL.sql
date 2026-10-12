USE marketing_analytics;

SHOW TABLES;
SELECT COUNT(*) AS total_customers
FROM marketing_data_working;
SELECT *
FROM marketing_data_working
LIMIT 10;
DESCRIBE marketing_data_working;
SELECT COUNT(*) AS total_rows
FROM marketing_data_working;
SELECT ID, COUNT(*) AS duplicate_count
FROM marketing_data_working
GROUP BY ID
HAVING COUNT(*) > 1;
SELECT COUNT(*) AS missing_income
FROM marketing_data_working
WHERE Income IS NULL
   OR TRIM(Income) = '';
   SELECT COUNT(*) AS missing_valid_age
FROM marketing_data_working
WHERE Valid_age IS NULL
   OR TRIM(Valid_age) = '';
   SELECT Education,
       COUNT(*) AS customer_count
FROM marketing_data_working
GROUP BY Education
ORDER BY customer_count DESC;
SELECT Marital_Status,
       COUNT(*) AS customer_count
FROM marketing_data_working
GROUP BY Marital_Status
ORDER BY customer_count DESC;

SELECT COUNT(*) AS total_rows
FROM marketing_data_working;

SELECT ID, COUNT(*) AS duplicate_count
FROM marketing_data_working
GROUP BY ID
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS missing_income
FROM marketing_data_working
WHERE Income IS NULL
   OR TRIM(Income) = '';

SELECT COUNT(*) AS missing_valid_age
FROM marketing_data_working
WHERE Valid_age IS NULL
   OR TRIM(Valid_age) = '';

SELECT Education,
       COUNT(*) AS customer_count
FROM marketing_data_working
GROUP BY Education
ORDER BY customer_count DESC;

SELECT Marital_Status,
       COUNT(*) AS customer_count
FROM marketing_data_working
GROUP BY Marital_Status
ORDER BY customer_count DESC;
SELECT 
    ROUND(AVG(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))), 2) AS average_income
FROM marketing_data_working;
SELECT 
    MIN(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))) AS minimum_income,
    MAX(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))) AS maximum_income
FROM marketing_data_working;
SELECT
    SUM(MntWines) AS wine_spending,
    SUM(MntFruits) AS fruit_spending,
    SUM(MntMeatProducts) AS meat_spending,
    SUM(MntFishProducts) AS fish_spending,
    SUM(MntSweetProducts) AS sweet_spending,
    SUM(MntGoldProds) AS gold_spending
FROM marketing_data_working;
SELECT
    ROUND(AVG(MntWines), 2) AS avg_wines,
    ROUND(AVG(MntFruits), 2) AS avg_fruits,
    ROUND(AVG(MntMeatProducts), 2) AS avg_meat,
    ROUND(AVG(MntFishProducts), 2) AS avg_fish,
    ROUND(AVG(MntSweetProducts), 2) AS avg_sweets,
    ROUND(AVG(MntGoldProds), 2) AS avg_gold
FROM marketing_data_working;
SELECT
    SUM(AcceptedCmp1) AS campaign_1,
    SUM(AcceptedCmp2) AS campaign_2,
    SUM(AcceptedCmp3) AS campaign_3,
    SUM(AcceptedCmp4) AS campaign_4,
    SUM(AcceptedCmp5) AS campaign_5,
    SUM(Response) AS latest_campaign
FROM marketing_data_working;
SELECT
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working;
SELECT
    SUM(NumWebPurchases) AS web_purchases,
    SUM(NumCatalogPurchases) AS catalog_purchases,
    SUM(NumStorePurchases) AS store_purchases
FROM marketing_data_working;
SELECT
    ROUND(AVG(NumWebPurchases), 2) AS avg_web_purchases,
    ROUND(AVG(NumCatalogPurchases), 2) AS avg_catalog_purchases,
    ROUND(AVG(NumStorePurchases), 2) AS avg_store_purchases
FROM marketing_data_working;
SELECT 
    ROUND(AVG(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))), 2) AS average_income
FROM marketing_data_working;
SELECT 
    MIN(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))) AS minimum_income,
    MAX(CAST(NULLIF(TRIM(Income), '') AS DECIMAL(10,2))) AS maximum_income
    FROM marketing_data_working;
    SELECT
    SUM(MntWines) AS wine_spending,
    SUM(MntFruits) AS fruit_spending,
    SUM(MntMeatProducts) AS meat_spending,
    SUM(MntFishProducts) AS fish_spending,
    SUM(MntSweetProducts) AS sweet_spending,
    SUM(MntGoldProds) AS gold_spending
FROM marketing_data_working;
SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_spending), 2) AS avg_spending
FROM
(
    SELECT
        CASE
            WHEN (MntWines + MntFruits + MntMeatProducts +
                  MntFishProducts + MntSweetProducts + MntGoldProds) >= 1000
                THEN 'High Value'
            WHEN (MntWines + MntFruits + MntMeatProducts +
                  MntFishProducts + MntSweetProducts + MntGoldProds) >= 500
                THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment,

        (MntWines + MntFruits + MntMeatProducts +
         MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spending

    FROM marketing_data_working
) AS customer_data

GROUP BY customer_segment
ORDER BY avg_spending DESC;
SELECT
    Education,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY Education
ORDER BY response_rate DESC;
SELECT
    Marital_Status,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY Marital_Status
ORDER BY response_rate DESC;
SELECT
    SUM(AcceptedCmp1) AS campaign_1,
    SUM(AcceptedCmp2) AS campaign_2,
    SUM(AcceptedCmp3) AS campaign_3,
    SUM(AcceptedCmp4) AS campaign_4,
    SUM(AcceptedCmp5) AS campaign_5,
    SUM(Response) AS last_campaign
FROM marketing_data_working;
SELECT
    ROUND(SUM(AcceptedCmp1) * 100.0 / COUNT(*), 2) AS campaign_1_rate,
    ROUND(SUM(AcceptedCmp2) * 100.0 / COUNT(*), 2) AS campaign_2_rate,
    ROUND(SUM(AcceptedCmp3) * 100.0 / COUNT(*), 2) AS campaign_3_rate,
    ROUND(SUM(AcceptedCmp4) * 100.0 / COUNT(*), 2) AS campaign_4_rate,
    ROUND(SUM(AcceptedCmp5) * 100.0 / COUNT(*), 2) AS campaign_5_rate,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS last_campaign_rate
FROM marketing_data_working;
SELECT
    Complain,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY Complain
ORDER BY Complain;
SELECT
    age_group,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM (
    SELECT
        Response,
        CASE
            WHEN 2024 - Year_Birth < 30 THEN 'Under 30'
            WHEN 2024 - Year_Birth BETWEEN 30 AND 39 THEN '30-39'
            WHEN 2024 - Year_Birth BETWEEN 40 AND 49 THEN '40-49'
            WHEN 2024 - Year_Birth BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60+'
        END AS age_group
    FROM marketing_data_working
    WHERE Year_Birth BETWEEN 1940 AND 2004
) AS customer_age
GROUP BY age_group
ORDER BY response_rate DESC;
SELECT
    Country,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY Country
ORDER BY total_customers DESC;
SELECT
    CASE
        WHEN (NumWebPurchases + NumCatalogPurchases + NumStorePurchases) = 0
            THEN 'No Purchases'
        WHEN (NumWebPurchases + NumCatalogPurchases + NumStorePurchases) BETWEEN 1 AND 5
            THEN 'Low Purchases'
        WHEN (NumWebPurchases + NumCatalogPurchases + NumStorePurchases) BETWEEN 6 AND 15
            THEN 'Medium Purchases'
        ELSE 'High Purchases'
    END AS purchase_group,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY purchase_group
ORDER BY response_rate DESC;
SELECT
    CASE
        WHEN Recency <= 30 THEN '0-30 Days'
        WHEN Recency BETWEEN 31 AND 60 THEN '31-60 Days'
        WHEN Recency BETWEEN 61 AND 90 THEN '61-90 Days'
        ELSE '90+ Days'
    END AS recency_group,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM marketing_data_working
GROUP BY
    CASE
        WHEN Recency <= 30 THEN '0-30 Days'
        WHEN Recency BETWEEN 31 AND 60 THEN '31-60 Days'
        WHEN Recency BETWEEN 61 AND 90 THEN '61-90 Days'
        ELSE '90+ Days'
    END
ORDER BY response_rate DESC;

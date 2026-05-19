
-- Retail Business Performance & Profitability Analysis
-- Dataset: Store_CA.csv

-- 1. Create Database
CREATE DATABASE retail_analysis;
USE retail_analysis;

-- 2. Create Table
CREATE TABLE retail_store (
    ProductVariety INT,
    MarketingSpend INT,
    CustomerFootfall INT,
    StoreSize INT,
    EmployeeEfficiency DECIMAL(5,2),
    StoreAge INT,
    CompetitorDistance INT,
    PromotionsCount INT,
    EconomicIndicator DECIMAL(5,2),
    StoreLocation VARCHAR(100),
    StoreCategory VARCHAR(100),
    MonthlySalesRevenue DECIMAL(10,2)
);

-- 3. View Dataset
SELECT * FROM retail_store;

-- 4. Count Total Records
SELECT COUNT(*) AS total_records
FROM retail_store;

-- 5. Check Missing/Null Values
SELECT *
FROM retail_store
WHERE ProductVariety IS NULL
   OR MarketingSpend IS NULL
   OR CustomerFootfall IS NULL
   OR StoreSize IS NULL
   OR EmployeeEfficiency IS NULL
   OR StoreAge IS NULL
   OR CompetitorDistance IS NULL
   OR PromotionsCount IS NULL
   OR EconomicIndicator IS NULL
   OR StoreLocation IS NULL
   OR StoreCategory IS NULL
   OR MonthlySalesRevenue IS NULL;

-- 6. Remove Null Records
DELETE FROM retail_store
WHERE ProductVariety IS NULL
   OR MarketingSpend IS NULL
   OR CustomerFootfall IS NULL
   OR StoreSize IS NULL
   OR EmployeeEfficiency IS NULL
   OR StoreAge IS NULL
   OR CompetitorDistance IS NULL
   OR PromotionsCount IS NULL
   OR EconomicIndicator IS NULL
   OR StoreLocation IS NULL
   OR StoreCategory IS NULL
   OR MonthlySalesRevenue IS NULL;

-- 7. Total Revenue by Store Category
SELECT StoreCategory,
       ROUND(SUM(MonthlySalesRevenue),2) AS Total_Revenue
FROM retail_store
GROUP BY StoreCategory
ORDER BY Total_Revenue DESC;

-- 8. Average Revenue by Store Location
SELECT StoreLocation,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreLocation
ORDER BY Avg_Revenue DESC;

-- 9. Top 10 Highest Revenue Stores by Category
SELECT StoreCategory,
       StoreLocation,
       MonthlySalesRevenue
FROM retail_store
ORDER BY MonthlySalesRevenue DESC
LIMIT 10;

-- 10. Marketing Spend vs Revenue
SELECT StoreCategory,
       ROUND(AVG(MarketingSpend),2) AS Avg_MarketingSpend,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreCategory
ORDER BY Avg_Revenue DESC;

-- 11. Customer Footfall Analysis
SELECT StoreLocation,
       ROUND(AVG(CustomerFootfall),2) AS Avg_Footfall,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreLocation
ORDER BY Avg_Footfall DESC;

-- 12. Employee Efficiency Impact on Revenue
SELECT StoreCategory,
       ROUND(AVG(EmployeeEfficiency),2) AS Avg_EmployeeEfficiency,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreCategory
ORDER BY Avg_EmployeeEfficiency DESC;

-- 13. Promotion Effectiveness
SELECT PromotionsCount,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY PromotionsCount
ORDER BY PromotionsCount;

-- 14. Store Size vs Revenue
SELECT StoreSize,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreSize
ORDER BY Avg_Revenue DESC;

-- 15. Competitor Distance Impact
SELECT CompetitorDistance,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY CompetitorDistance
ORDER BY Avg_Revenue DESC;

-- 16. Revenue Classification
SELECT StoreLocation,
       StoreCategory,
       MonthlySalesRevenue,
       CASE
           WHEN MonthlySalesRevenue >= 350 THEN 'High Revenue'
           WHEN MonthlySalesRevenue >= 250 THEN 'Medium Revenue'
           ELSE 'Low Revenue'
       END AS Revenue_Status
FROM retail_store;

-- 17. Top Performing Categories
SELECT StoreCategory,
       COUNT(*) AS Total_Stores,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreCategory
ORDER BY Avg_Revenue DESC;

-- 18. Identify Low Performing Stores
SELECT StoreLocation,
       StoreCategory,
       MonthlySalesRevenue
FROM retail_store
WHERE MonthlySalesRevenue < (
    SELECT AVG(MonthlySalesRevenue)
    FROM retail_store
)
ORDER BY MonthlySalesRevenue ASC;

-- 19. Revenue by Economic Indicator
SELECT EconomicIndicator,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY EconomicIndicator
ORDER BY Avg_Revenue DESC;

-- 20. Final Business Insights Query
SELECT StoreCategory,
       ROUND(AVG(CustomerFootfall),2) AS Avg_Footfall,
       ROUND(AVG(EmployeeEfficiency),2) AS Avg_Efficiency,
       ROUND(AVG(MonthlySalesRevenue),2) AS Avg_Revenue
FROM retail_store
GROUP BY StoreCategory
ORDER BY Avg_Revenue DESC;

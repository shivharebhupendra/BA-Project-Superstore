CREATE DATABASE E_Commerce_Sales;

Use E_Commerce_Sales;

-- Total Sales, Profit, and Quantity overall.
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Quantity), 2) AS Total_Quantity
FROM
    samplesuperstore;


-- Top 10 most profitable sub-categories.
SELECT 
    `Sub-Category`, ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    samplesuperstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 10;


-- Region-wise sales and profit.
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    samplesuperstore
GROUP BY Region;


-- State with highest loss.
SELECT 
    State, ROUND(SUM(Profit), 2) AS Total_Loss
FROM
    samplesuperstore
GROUP BY State
ORDER BY Total_Loss ASC
LIMIT 1; 


-- Relationship between discount and profit (does high discount always mean high loss?).
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount > 0.2 AND Discount <= 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (>40%)'
    END AS Discount_Range,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM samplesuperstore
GROUP BY Discount_Range
ORDER BY Total_Profit ASC;


-- Segment-wise (Consumer, Corporate, Home Office) revenue.
SELECT 
    Segment, ROUND(SUM(Sales), 2) AS Revenue
FROM
    samplesuperstore
GROUP BY Segment;

-- Top 5 cities contributing most revenue.
SELECT 
    City, ROUND(SUM(Sales), 2) AS Revenue
FROM
    samplesuperstore
GROUP BY City
ORDER BY Revenue DESC
LIMIT 5; 


-- Orders with negative profit.
SELECT 
    *
FROM
    samplesuperstore
WHERE
    Profit < 0;


-- Compare sales vs profit for each shipping mode.
SELECT 
    `Ship Mode`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    samplesuperstore
GROUP BY `Ship Mode`;
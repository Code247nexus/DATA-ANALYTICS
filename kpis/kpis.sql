CREATE DATABASE IF NOT EXISTS ecommerce_sales;
USE ecommerce_sales;



SELECT COUNT(*) FROM Ecommerce_Sales;
SELECT * FROM Ecommerce_Sales LIMIT 5;
DESCRIBE Ecommerce_Sales;

-- ============================================
-- KPI 1: Overall Business Summary
-- Finds: total revenue, total orders, average order value
-- Why it matters: the "headline numbers" any stakeholder asks for first
-- ============================================
SELECT 
    COUNT(*) AS total_orders,
    SUM(Total) AS total_revenue,
    ROUND(AVG(Total), 2) AS avg_order_value,
    SUM(Quantity) AS total_units_sold
FROM Ecommerce_Sales
WHERE Is_Return = 0;  -- exclude flagged anomalies from revenue KPIs


-- ============================================
-- KPI 2: Revenue by Category
-- Finds: which product categories drive the most revenue
-- Why it matters: tells the business where to focus inventory/marketing
-- ============================================
SELECT 
    Category,
    COUNT(*) AS order_count,
    SUM(Total) AS category_revenue,
    ROUND(AVG(Total), 2) AS avg_order_value,
    ROUND(SUM(Total) * 100.0 / (SELECT SUM(Total) FROM ecommerce_sales WHERE Is_Return = 0), 2) AS pct_of_total_revenue
FROM Ecommerce_Sales
WHERE Is_Return = 0
GROUP BY Category
ORDER BY category_revenue DESC;


-- ============================================
-- KPI 3: Top 5 Products by Revenue
-- Finds: best-selling individual products (not just categories)
-- Why it matters: more actionable than category-level for restocking decisions
-- ============================================
SELECT 
    Product,
    Category,
    COUNT(*) AS times_ordered,
    SUM(Quantity) AS total_units_sold,
    SUM(Total) AS product_revenue
FROM Ecommerce_Sales
WHERE Is_Return = 0
GROUP BY Product, Category
ORDER BY product_revenue DESC
LIMIT 5;


-- ============================================
-- KPI 4: Monthly Revenue Trend
-- Finds: how revenue moves month over month
-- Why it matters: spots seasonality, growth, or decline patterns
-- ============================================
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS order_month,
    COUNT(*) AS order_count,
    SUM(Total) AS monthly_revenue
FROM Ecommerce_Sales
WHERE Is_Return = 0
GROUP BY order_month
ORDER BY order_month;


-- ============================================
-- KPI 5: Month-over-Month Growth % (Window Function)
-- Finds: the percentage change in revenue from one month to the next
-- Why it matters: raw revenue numbers don't show momentum — growth % does.
-- This is the query most likely to come up in an interview, since it uses LAG()
-- ============================================
SELECT 
    order_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY order_month) AS prev_month_revenue,
    ROUND(
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY order_month)) * 100.0 
        / LAG(monthly_revenue) OVER (ORDER BY order_month), 2
    ) AS growth_pct
FROM (
    SELECT 
        DATE_FORMAT(Order_Date, '%Y-%m') AS order_month,
        SUM(Total) AS monthly_revenue
    FROM Ecommerce_Sales
    WHERE Is_Return = 0
    GROUP BY order_month
) AS monthly_data
ORDER BY order_month;


-- ============================================
-- KPI 6: Customer Segmentation by Spend (CTE)
-- Finds: which customers are High/Mid/Low value based on total spend
-- Why it matters: tells marketing who to prioritize for retention efforts
-- ============================================
WITH customer_totals AS (
    SELECT 
        Customer_Name,
        COUNT(*) AS order_count,
        SUM(Total) AS total_spent
    FROM Ecommerce_Sales
    WHERE Is_Return = 0
    GROUP BY Customer_Name
)
SELECT 
    Customer_Name,
    order_count,
    total_spent,
    CASE 
        WHEN total_spent > 3000 THEN 'High Value'
        WHEN total_spent > 1000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_totals
ORDER BY total_spent DESC;


-- ============================================
-- KPI 7: Payment Method Popularity
-- Finds: which payment methods customers use most, and their average order value
-- Why it matters: informs which payment partnerships/fees matter most
-- ============================================
SELECT 
    Payment_Method,
    COUNT(*) AS order_count,
    SUM(Total) AS total_revenue,
    ROUND(AVG(Total), 2) AS avg_order_value
FROM Ecommerce_Sales
WHERE Is_Return = 0
GROUP BY Payment_Method
ORDER BY total_revenue DESC;


-- ============================================
-- KPI 8: Order Status Breakdown
-- Finds: what % of orders are Delivered vs Cancelled vs Returned vs in-transit
-- Why it matters: operational health check — high cancellation/return rates flag problems
-- ============================================
SELECT 
    Status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ecommerce_sales), 2) AS pct_of_orders
FROM Ecommerce_Sales
GROUP BY Status
ORDER BY order_count DESC;


-- ============================================
-- KPI 9: Top Customer by Order Volume (not just spend)
-- Finds: most frequent buyers — different insight than highest spenders
-- Why it matters: frequent-but-low-spend customers are good loyalty program targets
-- ============================================
SELECT 
    Customer_Name,
    COUNT(*) AS order_count,
    SUM(Total) AS total_spent
FROM Ecommerce_Sales
WHERE Is_Return = 0
GROUP BY Customer_Name
ORDER BY order_count DESC
LIMIT 10;


-- ============================================
-- KPI 10: Anomaly/Return Impact
-- Finds: how much revenue is affected by the flagged negative-value anomalies
-- Why it matters: quantifies the data quality issue's business impact — good talking point
-- ============================================
SELECT 
    Is_Return,
    COUNT(*) AS row_count,
    SUM(Total) AS total_value
FROM Ecommerce_Sales
GROUP BY Is_Return;


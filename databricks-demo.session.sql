-- ============================================================================
-- File: databricks-demo.session.sql
-- Purpose: Monthly Order Analysis for Retail Customer 360 Demo
-- 
-- Description:
--   This SQL query analyzes order patterns by aggregating order data at a
--   monthly level. It provides key metrics including order volumes, revenue,
--   and order amount statistics (average, min, max) to help understand
--   customer purchasing behavior over time.
--
-- Data Source:
--   Table: demos.dbdemos_retail_c360.churn_orders
--   This table contains historical order data used for customer churn analysis
--   in the retail and consumer goods sector.
--
-- Output Columns:
--   - order_month: The month of the orders (truncated to first day of month)
--   - total_orders: Total number of orders in that month
--   - avg_order_amount: Average order value for the month (rounded to 2 decimals)
--   - total_revenue: Sum of all order amounts for the month (rounded to 2 decimals)
--   - min_order_amount: Smallest order value in the month (rounded to 2 decimals)
--   - max_order_amount: Largest order value in the month (rounded to 2 decimals)
--
-- Usage:
--   This query is typically used for:
--   - Identifying seasonal trends in customer orders
--   - Analyzing revenue patterns over time
--   - Understanding order value distribution by month
--   - Supporting churn prediction models with historical order metrics
-- ============================================================================

-- Average order amount by month
SELECT 
    -- Truncate the creation date to the first day of each month for grouping
    DATE_TRUNC('month', creation_date) as order_month,
    
    -- Count total number of orders in each month
    COUNT(*) as total_orders,
    
    -- Calculate the average order amount, rounded to 2 decimal places for currency
    ROUND(AVG(amount), 2) as avg_order_amount,
    
    -- Sum all order amounts to get total monthly revenue
    ROUND(SUM(amount), 2) as total_revenue,
    
    -- Find the minimum order amount in the month
    ROUND(MIN(amount), 2) as min_order_amount,
    
    -- Find the maximum order amount in the month
    ROUND(MAX(amount), 2) as max_order_amount
    
-- Source table containing order records with creation dates and amounts
FROM demos.dbdemos_retail_c360.churn_orders

-- Group all metrics by month
GROUP BY DATE_TRUNC('month', creation_date)

-- Sort results with most recent months first
ORDER BY order_month DESC;

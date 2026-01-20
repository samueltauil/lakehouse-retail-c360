

-- Average order amount by month
SELECT 
    DATE_TRUNC('month', creation_date) as order_month,
    COUNT(*) as total_orders,
    ROUND(AVG(amount), 2) as avg_order_amount,
    ROUND(SUM(amount), 2) as total_revenue,
    ROUND(MIN(amount), 2) as min_order_amount,
    ROUND(MAX(amount), 2) as max_order_amount
FROM demos.dbdemos_retail_c360.churn_orders
GROUP BY DATE_TRUNC('month', creation_date)
ORDER BY order_month DESC;

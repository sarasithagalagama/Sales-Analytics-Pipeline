SELECT 
    DATE_TRUNC('month', order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM {{ ref('stg_superstore_sales') }}
GROUP BY sales_month
ORDER BY sales_month
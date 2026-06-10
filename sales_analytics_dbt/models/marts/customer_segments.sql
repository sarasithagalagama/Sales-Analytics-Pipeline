SELECT 
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT customer_id) AS total_customers
FROM {{ ref('stg_superstore_sales') }}
GROUP BY segment
ORDER BY total_sales DESC
SELECT 
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(AVG(discount), 2) AS avg_discount
FROM {{ ref('stg_superstore_sales') }}
GROUP BY category, sub_category
ORDER BY total_profit ASC
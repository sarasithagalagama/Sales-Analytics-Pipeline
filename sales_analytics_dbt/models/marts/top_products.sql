SELECT 
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit
FROM {{ ref('stg_superstore_sales') }}
GROUP BY product_name, category, sub_category
ORDER BY total_sales DESC
SELECT *
FROM superstore_sales
LIMIT 10;

SELECT COUNT(*)
FROM superstore_sales;

SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales;
-- Overall sales and profit summary
SELECT 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_sales;


-- Revenue by month
SELECT 
    DATE_TRUNC('month', order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS total_revenue
FROM superstore_sales
GROUP BY sales_month
ORDER BY sales_month;


-- Top 10 products by sales
SELECT 
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY product_name, category, sub_category
ORDER BY total_sales DESC
LIMIT 10;


-- Sales and profit by customer segment
SELECT 
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;


-- Regional sales and profit performance
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;


-- Discount impact on sales and profit
SELECT 
    discount,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit_per_order
FROM superstore_sales
GROUP BY discount
ORDER BY discount;


-- High discount orders with negative profit
SELECT 
    order_id,
    product_name,
    category,
    sub_category,
    region,
    discount,
    sales,
    profit
FROM superstore_sales
WHERE discount >= 0.30
  AND profit < 0
ORDER BY profit ASC
LIMIT 20;


-- Category and sub-category performance
SELECT 
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(AVG(discount), 2) AS avg_discount
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY total_profit ASC;
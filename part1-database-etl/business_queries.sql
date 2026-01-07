-- Use database
USE fleximart;

-- ===============================
-- 1. Total number of customers
-- ===============================
SELECT COUNT(*) AS total_customers
FROM customers;


-- ===============================
-- 2. Total number of products
-- ===============================
SELECT COUNT(*) AS total_products
FROM products;


-- ===============================
-- 3. Total sales revenue
-- ===============================
SELECT 
    SUM(total_amount) AS total_revenue
FROM sales;


-- ===============================
-- 4. Total number of orders
-- ===============================
SELECT 
    COUNT(*) AS total_orders
FROM sales;


-- ===============================
-- 5. Top 5 best-selling products
-- ===============================
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- ===============================
-- 6. Revenue by product category
-- ===============================
SELECT 
    p.category,
    SUM(s.total_amount) AS category_revenue
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;


-- ===============================
-- 7. Monthly sales trend
-- ===============================
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;


-- ===============================
-- 8. Customers with most orders
-- ===============================
SELECT 
    c.first_name,
    c.last_name,
    COUNT(s.sale_id) AS total_orders
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 5;


-- ===============================
-- 9. Products with low stock
-- ===============================
SELECT 
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 5
ORDER BY stock_quantity ASC;


-- ===============================
-- 10. Average order value
-- ===============================
SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM sales;

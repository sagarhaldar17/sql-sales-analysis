-- ==============================
-- SALES DATA ANALYSIS PROJECT
-- ==============================
Create Database Sales;
use Sales;
CREATE TABLE sales_data (
	order_id INT Primary key,
	order_date DATE,
	customer_id INT,
	customer_name VARCHAR(50),
	product VARCHAR(50),
	category VARCHAR(50),
	quantity INT,
	price DECIMAL(10,2));
INSERT INTO sales_data VALUES
	(1, '2024-01-05', 101, 'Amit', 'Laptop', 'Electronics', 1, 50000),
	(2, '2024-01-06', 102, 'Rahul', 'Phone', 'Electronics', 2, 20000),
	(3, '2024-01-07', 103, 'Sita', 'Shoes', 'Fashion', 3, 2000),
	(4, '2024-01-08', 101, 'Amit', 'Headphones', 'Electronics', 1, 3000),
	(5, '2024-01-09', 104, 'Riya', 'Dress', 'Fashion', 2, 1500),
	(6, '2024-02-01', 105, 'Karan', 'Tablet', 'Electronics', 1, 15000),
	(7, '2024-02-03', 102, 'Rahul', 'Shoes', 'Fashion', 1, 2000),
	(8, '2024-02-05', 106, 'Neha', 'Watch', 'Accessories', 2, 2500),
	(9, '2024-02-07', 107, 'Arjun', 'Phone', 'Electronics', 1, 20000),
	(10, '2024-02-10', 108, 'Pooja', 'Bag', 'Accessories', 3, 1000);
    
-- ==============================
-- DATA ANALYSIS QUERIES
-- ==============================

-- 1. Total Revenue
SELECT sum(quantity * price) AS total_revenue FROM sales_data;

-- 2. Top 5 Products
SELECT product, sum(quantity * price) AS revenue
FROM sales_data
GROUP BY product
ORDER BY revenue DESC limit 5;

-- 3. Sales by Category
SELECT Category, sum(quantity * price) AS revenue
FROM sales_data
GROUP BY Category
ORDER BY revenue DESC;

-- 4. Total number of orders
SELECT COUNT(*) AS total_orders FROM sales_data;

-- 5. Top 3 customers
SELECT customer_name, SUM(quantity * price) AS total_spent
FROM sales_data
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- Monthly sales trend
SELECT MONTH(order_date) AS month, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- Insight:
-- Total revenue generated is ₹147,000.
-- Electronics category contributes ₹128,000 (~87%) of total revenue, making it the top-performing category.
-- Top 2 customers (Amit and Rahul) contribute ₹95,000 (~65%) of total revenue.
-- Monthly analysis shows revenue decreased from ₹102,000 in January to ₹45,000 in February.

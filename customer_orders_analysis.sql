use SALES;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(101, 'Amit', 'Kolkata'),
(102, 'Rahul', 'Delhi'),
(103, 'Sita', 'Mumbai'),
(104, 'Riya', 'Kolkata'),
(105, 'Karan', 'Delhi');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders VALUES
(1, 101, '2024-01-10', 5000),
(2, 102, '2024-01-12', 7000),
(3, 101, '2024-02-05', 3000),
(4, 103, '2024-02-10', 8000),
(5, 104, '2024-02-15', 2000),
(6, 102, '2024-03-01', 6000),
(7, 105, '2024-03-05', 4000);

-- 1. Customer Orders Details
SELECT c.customer_name, c.city, o.order_date, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Total Spending per Customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- 3. Top Customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 4. Orders by City
SELECT c.city, SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- 5. Monthly Revenue
SELECT MONTH(o.order_date) AS month, SUM(o.amount) AS revenue
FROM orders o
GROUP BY month
ORDER BY month;

-- ==============================
-- KEY INSIGHTS
-- ==============================
-- Top customers contribute the highest share of revenue.
-- Customers from specific cities generate more sales than others.
-- Monthly revenue shows variation, indicating changing customer demand.




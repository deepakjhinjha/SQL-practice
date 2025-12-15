create database deeepak444;
use deeepak444;
-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Create Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting Customers
INSERT INTO customers (customer_id, name, email, city, country) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Jaipur', 'India'),
(2, 'Priya Singh', 'priya@gmail.com', 'Delhi', 'India'),
(3, 'John Doe', 'john@gmail.com', 'New York', 'USA');

-- Inserting Products
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Headphones', 'Electronics', 2000),
(103, 'Coffee Mug', 'Home', 300),
(104, 'T-Shirt', 'Fashion', 800);

-- Inserting Orders
INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(5001, 1, 101, 1, '2025-11-01'),
(5002, 2, 102, 2, '2025-11-05'),
(5003, 1, 104, 3, '2025-11-10'),
(5004, 3, 103, 5, '2025-11-15');

-- verfying data 
-- Check tables
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- monthly sales trend 
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(p.price * o.quantity) AS monthly_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- top customer 
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- top customer per product 
SELECT product_id, product_name, customer_id, name, total_spent
FROM (
    SELECT 
        p.product_id,
        p.product_name,
        c.customer_id,
        c.name,
        SUM(p.price * o.quantity) AS total_spent,
        RANK() OVER (
            PARTITION BY p.product_id 
            ORDER BY SUM(p.price * o.quantity) DESC
        ) AS rnk
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY p.product_id, p.product_name, c.customer_id, c.name
) ranked
WHERE rnk = 1;

-- top sales of each month category wise 
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    p.category,
    SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), p.category
ORDER BY month, total_sales DESC;

-- top sales by prodcut category per mponth 
SELECT month, category, total_sales
FROM (
    SELECT 
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        p.category,
        SUM(p.price * o.quantity) AS total_sales,
        RANK() OVER (
            PARTITION BY DATE_FORMAT(o.order_date, '%Y-%m')
            ORDER BY SUM(p.price * o.quantity) DESC
        ) AS rnk
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), p.category
) ranked
WHERE rnk = 1
ORDER BY month;



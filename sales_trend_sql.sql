CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
INSERT INTO orders VALUES
(1, '2024-01-15', 150.00, 101),
(2, '2024-01-22', 300.00, 102),
(3, '2024-02-03', 250.00, 101),
(4, '2024-03-10', 100.00, 103),
(5, '2024-03-18', 200.00, 104),
(6, '2024-04-01', 500.00, 102),
(7, '2024-04-15', 400.00, 105),
(8, '2024-05-20', 350.00, 106);

-- Monthly Revenue & Order Volume
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    year, month;
    
-- Top 3 Months by Revenue

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    monthly_revenue DESC
LIMIT 3;

-- Handle NULL Values (if any)

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(COALESCE(amount, 0)) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date);

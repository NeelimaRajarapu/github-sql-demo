CREATE TABLE customers (
   customer_id   INT PRIMARY KEY,
   first_name    VARCHAR(50),
   last_name     VARCHAR(50),
   email         VARCHAR(100),
   created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE orders (
   order_id      INT PRIMARY KEY,
   customer_id   INT,
   order_date    DATE,
   order_amount  DECIMAL(10, 2),
   status        VARCHAR(20),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Example query: total order amount per customer
SELECT
   c.customer_id,
   c.first_name,
   c.last_name,
   SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
   c.customer_id,
   c.first_name,
   c.last_name
ORDER BY total_spent DESC;
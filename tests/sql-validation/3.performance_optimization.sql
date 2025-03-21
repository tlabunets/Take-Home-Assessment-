
-- add index for quick filtering and grouping
CREATE INDEX idx_orders_order_date_customer ON orders (order_date, customer_id);


-- limit the number of lines using LIMIT

SELECT customer_id, COUNT(*) AS order_count 
FROM orders 
WHERE order_date >= '2023-01-01' 
GROUP BY customer_id 
ORDER BY order_count DESC
LIMIT 100

-- recreate table with partiotion on date field, add partitions, copy data to new table from old one.
-- the aggregation or filtering query for order_date will be executed only on the relevant batches, which is much faster

CREATE TABLE orders_new (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL
) PARTITION BY RANGE (order_date);

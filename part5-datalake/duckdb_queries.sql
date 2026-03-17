
-- Q1: List all customers along with the total number of orders they have placed
SELECT c.name, COUNT(o.order_id) as total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value

SELECT customer_id, SUM(total_amount) as total_value
FROM read_json_auto('datasets/orders.json')
GROUP BY customer_id
ORDER BY total_value DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT p.product_name
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p ON o.product_id = p.product_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name, and quantity
SELECT 
    c.name as customer_name, 
    o.order_date, 
    p.product_name, 
    o.num_items as quantity
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p ON o.product_id = p.product_id;

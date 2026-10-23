CREATE database Retail;
use retail;
drop table customers;
drop table order_items;
drop table orders;
drop table products;
select * from customers;


SELECT 
    o.order_id,
    o.order_date,
    o.shipped_date,
    oi.list_price,
    oi.total_price,
    oi.quantity,
    p.product_name,
    p.model_year,
    p.product_id
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON p.product_id = oi.product_id;
    
SELECT 
    o.store_id, SUM(oi.total_price) AS total_Sales
FROM
    orders o
        INNER JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY o.store_id;

SELECT 
    product_name, SUM(quantity) AS total_quantity
FROM
    order_items
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT 
    c.customer_id,
    COUNT(DISTINCT o.order_id) AS order_placed,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.total_price) AS total_revenue
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id;

select * from order_items;

SELECT 
    o.customer_id,
    SUM(oi.total_price) AS total_spend,
    CASE
        WHEN SUM(oi.total_price) <= 10000 THEN 'Low'
        WHEN SUM(oi.total_price) BETWEEN 10001 AND 20000 THEN 'Medium'
        else 'High'
    END AS Spendind_brackets
FROM
    orders o
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id;


SELECT 
    s.staff_id, SUM(oi.total_price)
FROM
    staffs s
        JOIN
    orders o ON o.staff_id = s.staff_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY s.staff_id;

SELECT 
    p.product_name, 
    st.quantity AS remaining_stock, 
    st.store_id
FROM stocks st
JOIN products p ON p.product_id = st.product_id
WHERE st.quantity < 10;



USE Retail;

-- Step 1: Add Primary Keys to all tables
ALTER TABLE categories ADD PRIMARY KEY (category_id);
ALTER TABLE brands ADD PRIMARY KEY (brand_id);
ALTER TABLE stores ADD PRIMARY KEY (store_id);
ALTER TABLE customers ADD PRIMARY KEY (customer_id);
ALTER TABLE staffs ADD PRIMARY KEY (staff_id);
ALTER TABLE products ADD PRIMARY KEY (product_id);
ALTER TABLE orders ADD PRIMARY KEY (order_id);

-- Add composite Primary Keys for junction tables
ALTER TABLE order_items ADD PRIMARY KEY (order_id, item_id);
ALTER TABLE stocks ADD PRIMARY KEY (store_id, product_id);

USE Retail;

-- Step 1: Replace the text 'NA' with a proper SQL NULL
UPDATE staffs 
SET manager_id = NULL 
WHERE manager_id = 'NA';

-- Step 2: Now change the column to an Integer
ALTER TABLE staffs MODIFY manager_id INT;

-- Step 2: Now link the tables together with Foreign Keys
ALTER TABLE products 
ADD FOREIGN KEY (category_id) REFERENCES categories(category_id),
ADD FOREIGN KEY (brand_id) REFERENCES brands(brand_id);

ALTER TABLE staffs 
ADD FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD FOREIGN KEY (manager_id) REFERENCES staffs(staff_id);

--
USE Retail;
SELECT order_id, customer_id 
FROM orders 
WHERE customer_id NOT IN (SELECT customer_id FROM customers);

-- Disable safe updates just in case
SET SQL_SAFE_UPDATES = 0;

-- Delete the orders that have invalid customer IDs
DELETE FROM orders 
WHERE customer_id NOT IN (SELECT customer_id FROM customers);

-- Also, check if any store_ids or staff_ids in orders are invalid and delete them too:
DELETE FROM orders WHERE store_id NOT IN (SELECT store_id FROM stores);
DELETE FROM orders WHERE staff_id NOT IN (SELECT staff_id FROM staffs);

ALTER TABLE orders 
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
ADD FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD FOREIGN KEY (staff_id) REFERENCES staffs(staff_id);

--

-- Step 1: Delete items that belong to the orders we just removed
DELETE FROM order_items 
WHERE order_id NOT IN (SELECT order_id FROM orders);

-- Step 2: Delete any items that have a missing product ID (just to be safe!)
DELETE FROM order_items 
WHERE product_id NOT IN (SELECT product_id FROM products);

ALTER TABLE order_items 
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id),
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE stocks 
ADD FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);
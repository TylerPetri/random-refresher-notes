SELECT *
FROM store
LIMIT 10;

SELECT COUNT(DISTINCT(order_id)) 
FROM store;

SELECT COUNT(DISTINCT(customer_id)) 
FROM store;

SELECT customer_id, customer_email, customer_phone
FROM store
WHERE customer_id = 1;

SELECT item_1_id, item_1_name, item_1_price
FROM store
WHERE item_1_id = 4;

-- normalize
CREATE TABLE customers AS 
SELECT DISTINCT customer_id, customer_phone, customer_email
FROM store;

ALTER TABLE customers 
ADD PRIMARY KEY (customer_id);

CREATE TABLE items AS
SELECT DISTINCT item_1_id as item_id, item_1_name as name, item_1_price as price 
FROM store
UNION
SELECT DISTINCT item_2_id as item_id, item_2_name as name, item_2_price as price
FROM store
WHERE item_2_id IS NOT NULL
UNION
SELECT DISTINCT item_3_id as item_id, item_3_name as name, item_3_price as price
FROM store
WHERE item_3_id IS NOT NULL;


ALTER TABLE items
ADD PRIMARY KEY (item_id);

-- many-to-many
CREATE TABLE orders_items AS
SELECT order_id, item_1_id as item_id
FROM store
UNION ALL
SELECT order_id, item_2_id as item_id
FROM store
WHERE item_2_id IS NOT NULL
UNION ALL
SELECT order_id, item_3_id as item_id
FROM store
WHERE item_3_id IS NOT NULL;

SELECT *
FROM store
WHERE order_id = 55;
SELECT * FROM orders_items WHERE order_id = 55;

CREATE TABLE orders AS
SELECT DISTINCT order_id, order_date, customer_id
FROM store;
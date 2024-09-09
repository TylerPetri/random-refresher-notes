-- SELECT * FROM customers LIMIT 10;
-- SELECT * FROM orders LIMIT 10;
-- SELECT * FROM books LIMIT 10;
SELECT * FROM pg_Indexes WHERE tablename = 'customers';
SELECT * FROM pg_Indexes WHERE tablename = 'orders';
SELECT * FROM pg_Indexes WHERE tablename = 'books';

-- EXPLAIN ANALYZE SELECT customer_id, quantity
-- FROM orders
-- WHERE quantity > 18;

CREATE INDEX orders_customer_id_quantity_idx ON orders(customer_id, quantity)
WHERE quantity > 18;

-- EXPLAIN ANALYZE SELECT customer_id, quantity
-- FROM orders
-- WHERE quantity > 18;

-- EXPLAIN ANALYZE SELECT *
-- FROM customers
-- WHERE customer_id < 100;

ALTER TABLE customers ADD PRIMARY KEY (customer_id);

-- EXPLAIN ANALYZE SELECT *
-- FROM customers
-- WHERE customer_id < 100;

-- customers table not sorted by primary key (now index), need to cluster
SELECT * FROM customers LIMIT 10;
-- CLUSTER customers USING customer_id;
SELECT * FROM customers LIMIT 10;

CREATE INDEX orders_customer_id_book_id_idx ON orders(customer_id, book_id);
DROP INDEX orders_customer_id_quantity_idx;
CREATE INDEX orders_customer_id_quantity_idx ON orders(customer_id, quantity)
WHERE quantity > 18;

-- combining indexes
CREATE INDEX books_author_title_idx ON books(author, title);

EXPLAIN ANALYZE quantity, price_base
FROM orders
WHERE (quantity * price_base) > 100;
CREATE INDEX orders_quantity_price_base_over_100_idx ON order(quantity, price_base)
WHERE (quantity * price_base) > 100;
EXPLAIN ANALYZE quantity, price_base
FROM orders
WHERE (quantity * price_base) > 100;

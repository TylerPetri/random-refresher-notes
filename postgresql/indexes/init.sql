SELECT * FROM customers;

SELECT * FROM pg_Indexes WHERE tablename = 'customers';

-- Planning time: 0.259 ms
-- Execution time: 10.304 ms
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE first_name = 'David';

-- Planning time: 0.065 ms
-- Execution time: 0.973 ms
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE last_name = 'Jones';

CREATE INDEX customers_city_idx ON customers(city);


EXPLAIN ANALYZE SELECT
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS NumOforders
FROM customers       AS c
INNER JOIN orders    AS o    
ON o.customer_id = c.customer_id
WHERE c.last_name IN ('Smith', 'Jones')
GROUP BY c.first_name, c.last_name;

CREATE INDEX customers_last_name_idx ON customers(last_name);

EXPLAIN ANALYZE SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

-- multi-column
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE last_name = 'Jones'
  AND first_name = 'David';

CREATE INDEX customers_last_name_first_name_idx ON customers(last_name, first_name);

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE last_name = 'Jones'
  AND first_name = 'David';

DROP INDEX IF EXISTS customers_city_idx;

-- size of file
SELECT pg_size_pretty (pg_total_relation_size('customers'));

CREATE INDEX customers_last_name_idx ON customers(last_name);

SELECT pg_size_pretty (pg_total_relation_size('customers'));

-- when insert big data, better to drop index and make new one after (can have script or previous sql thing for that where on update etc)
EXPLAIN ANALYZE SELECT first_name, last_name, email_address
FROM customers
WHERE last_name = 'Smith';

-- already customers_first_name_last_name_idx, why not add email_address? also won't use pointer for second search
CREATE INDEX customers_last_name_first_name_email_address_idx ON customers(last_name, first_name, email_address);

EXPLAIN ANALYZE SELECT first_name, last_name, email_address
FROM customers
WHERE last_name = 'Smith';
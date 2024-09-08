
--- 70 million entries, 258 million want -> partial index
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE years_old BETWEEN 13 AND 19;

CREATE INDEX customers_years_old_teen_idx ON customers(years_old)
WHERE years_old BETWEEN 13 AND 19;

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE years_old BETWEEN 13 AND 19;  


-- SELECT
--     user_name,
--     date_time
-- FROM logins
-- WHERE date_time >= (NOW() - INTERVAL'1 month')
-- ORDER BY date_time DESC;

-- CREATE INDEX logins_date_time_idx ON logins (date_time DESC, user_name);
-- ASC, NULLS FIRST, NULLS LAST

CREATE INDEX customers_state_name_email_address_idx ON customers(state_name, email_address);

EXPLAIN ANALYZE SELECT state_name, email_address
FROM customers
WHERE state_name = 'California' OR state_name = 'Ohio'
ORDER BY state_name DESC, email_address;

CREATE INDEX customers_state_name_email_address_ordered_idx ON customers(state_name DESC, email_address ASC);

EXPLAIN ANALYZE SELECT state_name, email_address
FROM customers
WHERE state_name = 'California' OR state_name = 'Ohio'
ORDER BY state_name DESC, email_address;
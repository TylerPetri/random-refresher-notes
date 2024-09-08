-- careless dev removed
ALTER TABLE customers ADD PRIMARY KEY (customer_id);

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';


--- all primary keys come with index
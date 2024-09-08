-- postgresql doesn't automatically update clusters, run CLUSTER
-- only one cluster allowed per table

-- CLUSTER products USING products_product_name_idx;
-- CLUSTER products; 1 table
-- CLUSTER; all tables

-- SELECT * FROM pg_Indexes WHERE tablename = 'customers';
CLUSTER customers USING customers_last_name_idx;
CLUSTER customers;
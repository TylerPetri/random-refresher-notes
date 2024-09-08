-- ExampleCustomer vs examplecustomer indexes

CREATE UNIQUE INDEX customers_email_address_lower_unique_idx ON customers(LOWER(email_address));

INSERT INTO customers (first_name, last_name, email_address)
VALUES ('Louis', 'Armstrong', 'louiarm@binchilling.ca'), ('Bin', 'Armstrong', 'LouiArm@binchilling.ca');
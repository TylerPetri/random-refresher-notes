-- First query
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id;

-- Second query
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';

SELECT COUNT(*)
FROM newspaper;

SELECT COUNT(*)
FROM online;


-- INNER JOIN -> C1 C2 C3 -> both middle C2 rows join where equals, and keeps all from both tables
SELECT COUNT(*)
FROM newspaper
JOIN online
  WHERE newspaper.id = online.id

-- LEFT JOIN -> when not met, right table NULL (does not require condition to be met)
-- First query
SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id;
  
-- Second query
SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id
WHERE online.id IS NULL;

-- Primary and foreign key
SELECT *
FROM classes
JOIN students
	ON classes.id = students.class_id;

-- CROSS JOIN -> combins every row from one table to another
SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3 
  AND end_month >= 3;
  
SELECT *
FROM newspaper
CROSS JOIN months;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month;

SELECT month, 
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month
GROUP BY month;

-- UNION -> adds rows from all tables into same columns
SELECT *
FROM newspaper
UNION
SELECT *
FROM online;
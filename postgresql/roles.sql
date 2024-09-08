-- 1
GRANT CREATE, USAGE 
ON SCHEMA marketing TO analyst;

-- 2
GRANT SELECT, INSERT, DELETE ON marketing.prospects TO analyst;

-- 3 
REVOKE DELETE ON marketing.prospects FROM analyst;

-- 4
SET ROLE analyst;

DELETE FROM marketing.prospects 
WHERE id = 2;



-- 1
GRANT SELECT, DELETE, UPDATE, INSERT ON census.economic_survey TO writer;

-- 2
ALTER DEFAULT PRIVILEGES 
IN SCHEMA census 
GRANT SELECT, DELETE, UPDATE, INSERT ON TABLES TO writer;

-- 3
CREATE TABLE census.housing_survey ( 
  area_id int primary key, 
  median_rent int 
);

-- 4
SELECT 
    table_schema,
    table_name,
    privilege_type
FROM information_schema.table_privileges 
WHERE table_schema  = 'census'
AND grantee = 'writer';

-- 1
GRANT SELECT ON projects to manager;

-- 2
GRANT UPDATE (project_name, project_status) 
ON projects to manager;

-- 3
select * 
from information_schema.column_privileges
where grantee = 'manager';


--- pg_catalog.pg_roles
--- information_schema.table_privileges
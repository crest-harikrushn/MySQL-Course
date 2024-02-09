-- ALTER TABLES

-- ADD COLUMN
-- ALTER TABLE table_name ADD [COLUMN] column_name column_definition
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- DROP COLUMN
-- ALTER TABLE table_name DROP [COLUMN] column_name
ALTER TABLE companies DROP COLUMN phone;


-- RENAME TABLE
-- RENAME TABLE tbl_name TO new_name
            -- OR
-- ALTER TABLE tbl_name RENAME TO new_name
RENAME TABLE companies to suppliers;
ALTER TABLE suppliers RENAME TO companies;

-- RENAME COLUMN
-- ALTER TABLE table_name RENAME COLUMN column_name TO new_col_name
ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- MODIFY: Modifies type of columns
-- ALTER TABLE tbl MODIFY column_name DATA TYPE
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

        -- or

-- CHANGE: change definition of column
-- ALTER TABLE tbl CHANGE old_column_name new_column_name DATA TYPE
ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

-- ADD OR DROP CONSTRAINTS
-- ALTER TABLE tbl ADD [CONSTRAINTS [CON_NAME]] CONSTRAINT_TO_BE_ADDED
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

-- ALTER TABLE tbl DROP [CONSTRAINTS] CON_NAME 
ALTER TABLE houses DROP CONSTRAINT positive_pprice;
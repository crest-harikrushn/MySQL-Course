-- ====================== 05 : 04 ======================
-- Drop the current cats table (if you have one)

DROP TABLE cats;



-- Create the new cats table:

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
-- Insert some cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

--====================== 05: 05 ======================
-- To get all the columns:
SELECT * FROM cats;

-- To only get the age column:
SELECT age FROM cats;

-- To select multiple specific columns:
SELECT name, breed FROM cats;

-- ============  05: 07 ========================
-- Use where to specify a condition:
SELECT * FROM cats WHERE age = 4;

SELECT * FROM cats WHERE name ='Egg';


-- ============  05: 09 ========================
-- challenge 


-- ============  05: 11 ========================
-- Use 'AS' to alias a column in your results (it doesn't actually change the name of the column in the table)
SELECT cat_id AS id, name FROM cats;


-- ============  05: 12 ========================
-- CODE: Updating Data
-- Change tabby cats to shorthair:
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

-- Another update:
UPDATE cats SET age=14 WHERE name='Misty';


-- ============  05: 12 ========================
-- ? Delete Won't reset auto_increment / delete won't alter anything, only deletes records.
-- Delete all cats with name of 'Egg':
DELETE FROM cats WHERE name='Egg';

-- Delete all rows in the cats table:
DELETE FROM cats;


-- ============  05: 12 ========================

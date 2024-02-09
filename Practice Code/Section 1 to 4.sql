SHOW DATABASES;

CREATE DATABASE pet_shop;

CREATE DATABASE test;


DROP DATABASE test;


SHOW TABLES;


CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);

CREATE TABLE dogs (
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);


SHOW COLUMNS FROM cats;

DESC cats;

DROP TABLE cats;

-- Re-create the cats table (I dropped it in a previous video)


CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);


-- Insert a cat:

INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);
And another:

INSERT INTO cats (name, age) 
VALUES ('Jenkins', 7);

-- Single insert (switching order of name and age)

INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');


-- Multiple Insert:

INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);

--Using NOT NULL:

CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);


-- Define a table with a DEFAULT name specified:

CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);

-- Notice the change when you describe the table:

DESC cats3;

-- Insert a cat without a name:

INSERT INTO cats3(age) VALUES(13);

-- Or a nameless, ageless cat:

INSERT INTO cats3() VALUES();

-- Combine NOT NULL and DEFAULT:

CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);

-- 04 : 16
-- One way of specifying a PRIMARY KEY

CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);


-- Another option:

CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);


-- 04 : 17
--  AUTO_INCREMENT

CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);



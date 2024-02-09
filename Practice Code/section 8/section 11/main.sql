-- NOT EQUAL: !=
SELECT * FROM books
WHERE released_year != 2017;

-- NOT LIKE
SELECT * FROM books
WHERE title NOT LIKE '%e%';

-- GREATER THAN: >
SELECT * FROM books
WHERE released_year > 2005;

SELECT * FROM books
WHERE pages > 500;


-- LESS THAN: <
-- GREATER THAN EQUALS TO
-- LESS THAN EQUALS TO
SELECT * FROM books
WHERE pages < 200;

SELECT * FROM books
WHERE released_year < 2000;

SELECT * FROM books
WHERE released_year <= 1985;

-- LOGICAL AND: AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';


-- LOGICAL OR: OR
SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;

SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;


SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';


-- BETWEEN (between two range) (both range is inclusive)
-- NOT BETWEEN (NOT between two range) (both range is inclusive)
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;


-- CAST(type AS another type) => convets one type to another
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);


SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;


-- IN(val1, val2, val3) => check if condition match in any of set of elements
-- NOT IN(val1, val2, val3) => check if condition match in any of set of elements
-- MODULO: % => returns reminders of devision
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');


SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;


-- SWITCH CASE
    -- CASE 
--        WHEN (condition) THEN (retun statement) 
--        WHEN (another condition) THEN (retun statement) 
--        ELSE (return statement) 
    -- END 
--       AS (field name)   (Optional)
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    

-- IS NULL
-- IS NOT NULL



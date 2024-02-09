INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


-- DISTINCT function
SELECT author_lname FROM books;
 
SELECT DISTINCT author_lname FROM books;
 
SELECT author_fname, author_lname FROM books;
 
--  These two below works same way
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
 
--  These two below works same way / combination of given list of columns must be unique
SELECT DISTINCT author_fname, author_lname FROM books;

-- ==============================
-- ORDER BY function
SELECT * FROM books
ORDER BY author_lname;

-- OPTIONS: ASC / DESC
SELECT * FROM books
ORDER BY author_lname DESC;

SELECT * FROM books
ORDER BY released_year;

-- MORE ON ORDER BY
-- Can provide column sequence number to refer to column when you have multiple columns selected for query for ex. (here in 2 is author_fname) 
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc;

-- Sorts data by first provided column and then to that sorted data, sort it again with another clumns. Sequence here is [author_lname and then author_fname]
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

-- can also provide asc / desc sequence to individual sorting parameter
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname DESC, author_fname ASC;

-- ========================================
-- LIMIT 
-- ========================================

SELECT title FROM books LIMIT 3;
 
-- LIMIT o/p to 5 records starting from 0th to 5th
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;

-- LIMIT o/p to 5 records starting from 2th to 5th
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 2,5;

SELECT title FROM books LIMIT 1;
 
SELECT title FROM books LIMIT 10;
 
SELECT * FROM books LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;
 
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;
 
SELECT * FROM tbl LIMIT 95,18446744073709551615;
 
SELECT title FROM books LIMIT 5;
 
SELECT title FROM books LIMIT 5, 123219476457;
 
SELECT title FROM books LIMIT 5, 50;



-- ================================
-- LIKE Operator
-- ================================
-- Anything in which "da" occurs
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';

-- ends with "da" (eg. fekrjfkkpda )
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da';

-- there should be something behind "da"  / like (eg. daojioiwju, ) / starts with "da" 
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE 'da%';

-- Anything which contains : in between
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';

-- string with exactly 4 characters
SELECT * FROM books
WHERE author_fname LIKE '____';

-- string with exactly 3 characters, middle one is a (eg. Dan, Fan, )
SELECT * FROM books
WHERE author_fname LIKE '_a_';


-- =============================================
-- Escape the LIKE Operator(% and _) using \% or \_
-- =============================================
-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';

-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

-- =============================================
-- Excercise: 
-- =============================================
SELECT title FROM books WHERE title LIKE '%stories%';
 
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
 
SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;
 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
 
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;
 
SELECT title, author_lname 
FROM books ORDER BY author_lname, title;
 
SELECT title, author_lname 
FROM books ORDER BY 2,1;
 
SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;
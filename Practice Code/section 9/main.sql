-- ==================== Aggregators =======================

-- =======================
-- COUNT (Does not count null)
-- =======================
SELECT COUNT(*) FROM books;

SELECT COUNT(author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;


-- =======================
-- GROUP BY (Group columns into single) (group by same value of given column)
-- Always GROUP BY followed by ORDER BY in sequence (GROUP BY {something} ORDER BY {something} ASC/DESC)
-- =======================
-- returns author name and their books count
select author_fname,count(title) as numOfBooksWritten from books group by author_fname; 

SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;

SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;


-- ==================================================
-- MIN & MAX aggregators
-- ==================================================

SELECT MAX(pages) FROM books;

SELECT MIN(author_lname) FROM books;


-- ? ==============================================================================================
-- ? SUB QUERIES  (will be executed first and it's return value will be used for previous query)
-- ? ===============================================================================================

-- * =========================================================
-- * traditional solution to find title and pages of book which has more pages
 select title, pages from books order by pages desc limit 1;

-- * alternative solution
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
-- * =======================================================

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);


-- ============
SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;

-- MORE ON MIN / MAX
-- find first book released year and last book released year by author also find total num of books written by author
select author_fname, author_lname, count(*) as books_written, min(released_year) as earliest_release, max(released_year) as latest_release from books group by author_fname, author_lname;


SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;

SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;


SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;

-- ===================================================
-- SUM aggregator
-- ===================================================
SELECT SUM(pages) FROM books;


SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;

-- ======================================================
-- AVG / AVERAGE Aaggregator
-- ======================================================

SELECT AVG(pages) FROM books;

SELECT AVG(released_year) FROM books;

SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;


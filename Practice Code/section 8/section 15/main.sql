-- ! VIEWS: virtual table obtained as a result of a query in SQL i.e. Structured Query Language

-- ? SYNTAX:
-- * CREATE VIEW viewname AS queries

--  ** INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;

-- ** WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- ** NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- ** (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;

-- Perform query on views
select genre, avg(rating) from full_reviews group by genre;


-- ! DAY 12
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

-- * UPDATE / ALTER / REPLACE VIEW: If exists replace or create new view
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

-- * ALTER
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;



-- ? WITH ROLLUP: The WITH ROLLUP modifier adds extra rows to the resultset that represent super-aggregate summaries. The super-aggregated column is represented by a NULL value. Multiple aggregates over different columns will be added if there are multiple GROUP BY columns.
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;


SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;


SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;


-- ! MODES: Modes affect the SQL syntax MySQL supports and the data validation checks it performs. This makes it easier to use MySQL in different environments and to use MySQL together with other database servers.

-- ? Viewing Modes in MySQL
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;


-- ? Setting Modes in MySQL
SET GLOBAL sql_mode = 'modes'; -- PASTE ALL MODES EXCEPTS YOU WANT TO REMOVE
SET SESSION sql_mode = 'modes';

-- ? STRICT_TRANS_TABLES
    -- * If a value could not be inserted as given into a transactional table, abort the statement. For a nontransactional table, abort the statement if the value occurs in a single-row statement or the first row of a multiple-row statement.

    -- EG. If you try to insert different type of data than described in table then it'll abort the transaction and won't add into database, if STRICT_TRANS_TABLES mode is enabled,
    -- OTHERWISE it'll simply insert data according to data type in table with falsy value and gives warning.


-- ? More Modes


-- ? ONLY_FULL_GROUP_BY
-- Reject queries for which the select list, HAVING condition, or ORDER BY list refer to nonaggregated columns that are neither named in the GROUP BY clause nor are functionally dependent on (uniquely determined by) GROUP BY columns.

-- ? NO_ZERO_IN_DATE

-- The NO_ZERO_IN_DATE mode affects whether the server permits dates in which the year part is nonzero but the month or day part is 0. (This mode affects dates such as '2010-00-01' or '2010-01-00', but not '0000-00-00'. To control whether the server permits '0000-00-00', use the NO_ZERO_DATE mode.) The effect of NO_ZERO_IN_DATE also depends on whether strict SQL mode is enabled.

-- If this mode is not enabled, dates with zero parts are permitted and inserts produce no warning.

-- If this mode is enabled, dates with zero parts are inserted as '0000-00-00' and produce a warning.

-- If this mode and strict mode are enabled, dates with zero parts are not permitted and inserts produce an error, unless IGNORE is given as well. For INSERT IGNORE and UPDATE IGNORE, dates with zero parts are inserted as '0000-00-00' and produce a warning.
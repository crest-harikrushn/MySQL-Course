-- == Concat String 
SELECT CONCAT('pi', 'ckle');

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

-- Concat with saperate value (first parameter)
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;

-- ========== SubString function
-- (String, start, end)
SELECT SUBSTRING('Hello World', 1, 4);

-- (String, start) = default end = string length
SELECT SUBSTRING('Hello World', 7);

-- (String, start) = starts from last character, and end till length
SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
-- Shorthand of substring function
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

-- ===== CONCAT AND SUBSTRING IN SINGLE QUERY
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


-- ===== REPLACE function
SELECT REPLACE('Hello World', 'Hell', '%$#@');
 
SELECT REPLACE('Hello World', 'l', '7');
 
SELECT REPLACE('Hello World', 'o', '0');
 
SELECT REPLACE('HellO World', 'o', '*');
 
SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;

SELECT REPLACE(title, ' ', '-') FROM books;

-- ========== REVERSE Function
SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- ======== CHAR_LENGTH => gives length of String
SELECT CHAR_LENGTH('Hello World');

SELECT CHAR_LENGTH(title) as length, title FROM books;
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- ======== LENGTH (gives length in bits) / space it takes to store value in bits
SELECT LENGTH('Hello World'); -- Gives 11
SELECT LENGTH('做做'); -- Gives (6) 


-- ======= UPPER and LOWER Function / UCASE, and LCASE function
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- ========= Other String Functions
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 

-- returns number of characters from left 
SELECT LEFT('omghahalol!', 3);

-- returns number of characters from right 
SELECT RIGHT('omghahalol!', 4);

-- repeat string {n} times
SELECT REPEAT('ha', 4);

-- trim white spaces from string
SELECT TRIM('  pickle  ');

-- trim {CHAR} occurance from string (left side)
SELECT TRIM(LEADING '.' FROM '.....  pickle...  ');

-- trim {CHAR} occurance from string (right side)
SELECT TRIM(TRAILING '.' FROM '.....  pickle...  ');

-- CHAR vs VARCHAR
-- CHAR: Stores fixed size length, even if passed value is shorter than given length then it'll add padding(white space) at the end and when retrives string, it'll remove padded String

-- VARCHAR: You can provide max lenght, and it'll store data of given length only, it'll not add any padding

-- Longer data then given length can't be added, it'll return error: data too long!



-- TINYINT: It stores value range from -128 to 127.
--          It takes 1 byte of storage to store the value. We can provide SIGNED / UNSIGNED Constraints for validation.
--          It'll round off the value if provided decimal (fractinal) value


-- DECIMAL: DECIMAL(Total No. of Digit, Digits after decimal) (eg. DECIMAL(5,2) can store 999.99 => 3digit before and 2 digit after decimal)
    -- Stores larger numbers using less data
    --  If more than 3 digit before decimal and only one digit after decimal which is technically in range of 5 but it can't store that (eg. 8765.1)
    -- however, if one digit before and 3 digit after decimal, it'll work. (eg. 3.098) but it'll round off the value to make it 2 digit after decimals

-- Data Type    | Memory Needed  | Precision issue
-- ------------------------------------------------
    -- FLOAT    |   4 Bytes    |     ~ 7 digits
    -- DOUBLE   |   8 Bytes    |     ~ 15 digits



-- DATE: Date Only, No Time (YYYY-MM-DD) Format
-- TIME: Time Only, No Date (HH:MM:SS) Format  (Range: -838:59:59 to 838:59:59)
-- DATETIME:  Date & Time (YYYY-MM-DD HH:MM:SS) Format 

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- CURDATE() | CURRENT_DATE(), CURTIME() | CURRENT_TIME(), NOW() | CURRENT_TIMESTAMP()
    SELECT CURTIME();

SELECT CURDATE();

SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());


-- DATE Functions
-- DAYOFWEEK(DATE): (1: Sunday, 2: Monday, ... , 7: Saturday)
-- DAYOFMONTH(DATE) | DAY(DATE): NUMBER
-- MONTHNAME(DATE): (January, February, ..., December)
SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;

SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;


-- HOUR(DATETIME | TIME): (1: Sunday, 2: Monday, ... , 7: Saturday)
-- MINUTE(DATETIME | TIME): NUMBER
-- SECOND(DATETIME | TIME): NUMBER
-- DATE(DATETIME): DATE
-- TIME(DATETIME): TIME
SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;

SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;


-- DATE_FORMAT({DATE | DATETIME}, FORMAT)
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- DATEDIFF(dt1, dt2): NO. OF DATE
-- DATEp_ADD(DATE, INTERVAL expr unit)   => (eg. DATE_ADD(date, INTERVAL 1 DAY)
-- DATEp_ADD(DATE, INTERVAL expr unit)   => (eg. DATE_ADD(date, INTERVAL 1 YEAR)

-- TIMEDIFF(time1, time2): hh:mm:ss


-- TIMESTAMP    => default if want to add: DEFAULT_TIMESTAMP
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);

CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
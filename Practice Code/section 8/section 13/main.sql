-- ! Data
INSERT INTO customers (first_name, last_name, email)
 VALUES ('Boy', 'George', 'george@gmail.com'),                                                                                                            ('George', 'Michael', 'gm@gmail.com'),
 ('David', 'Bowie', 'david@gmail.com'),
 ('Blue', 'Steele', 'blue@gmail.com'), 
 ('Bette', 'Davis', 'bette@aol.com'); 

 INSERT INTO orders (order_date, amount, customer_id) 
 VALUES ('2016-02-10', 99.99, 1),
 ('2017-11-11', 35.50, 1),
 ('2014-12-12', 800.67, 2),
 ('2015-01-03', 12.50, 2),
 ('1999-04-11', 450.25, 5);

--  ?========================

SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;


SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

-- cross join  / Cartesian Product
-- To perform a (kind of useless) cross join:
SELECT * FROM customers, orders;


-- ? INNER JOIN | JOIN
-- Our first inner join!
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

-- The order doesn't matter here:
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;


-- GROUP BY AND ORDER BY WITH INNER JOIN
SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;


-- ? LEFT JOIN (for every row in left table if there's matching row in right table then it'll merge. OTHERWISE it'll add NULL)
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;

-- * same o/p as inner join because there's no customer_id in orders table which is not in customers table 
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;


-- IFNULL function
SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS money_spent
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;


-- ? RIGHT JOIN (for every row in right table if there's matching row in left table then it'll merge. OTHERWISE it'll add NULL)
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;




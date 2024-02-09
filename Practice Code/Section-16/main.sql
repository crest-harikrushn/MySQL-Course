-- ? WINDOW FUNCTIONS
-- Performs aggregate operations on groups of rows, but they produce a result  FOR EACH ROW;

-- ? OVER() CLAUSE
-- it constructs a window. when it's empty, the window will include all records

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);


SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;


SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

-- ! ERROR: ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'window_func.employees.emp_no'; this is incompatible with sql_mode=only_full_group_by
SELECT 
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees;

-- ? PARTITION BY() CLAUSE
-- Inside of the OVER(), use PARTITION BY CLAUSE  to form rows into groups of row;

SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;


-- ? ORDER BY CLAUSE WITHIN OVER(): eg.: OVER(ORDER BY col ASC/DESC)
-- to re-order rows within each window.

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;


-- ? RANK() over_clause
-- Returns the rank of the current row within its partition, with gaps. Peers are considered ties and receive the same rank. This function does not assign consecutive ranks to peer groups if groups of size greater than one exist; the result is noncontiguous rank numbers.

-- if RANKING ties (means same data or value) then it skips the rank value and assigns both row, same rank

-- ? ROW_NUMBER(): Number of current row within its partition
-- Returns the number of the current row within its partition. Rows numbers range from 1 to the number of partition rows.

-- ORDER BY affects the order in which rows are numbered. Without ORDER BY, row numbering is nondeterministic.


-- ? DENSE_RANK() over_clause
-- Returns the rank of the current row within its partition, without gaps. Peers are considered ties and receive the same rank. This function assigns consecutive ranks to peer groups; the result is that groups of size greater than one do not produce noncontiguous rank numbers. For an example, see the RANK() function description.

-- * Example

SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,  --preserves next consiquitive number in sequence to assign
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num -- continue numbering, no grouping incase of same data
FROM employees ORDER BY overall_rank;



-- ? NTILE():	Bucket number of current row within its partition.
-- Divides a partition into N groups (buckets), assigns each row in the partition its bucket number, and returns the bucket number of the current row within its partition. For example, if N is 4, NTILE() divides rows into four buckets. If N is 100, NTILE() divides rows into 100 buckets.

-- N must be a literal positive integer. Bucket number return values range from 1 to N.
-- This function should be used with ORDER BY to sort partition rows into the desired order.

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;


-- ? FIRST_VALUE():	Value of argument from first row of window frame
-- FIRST_VALUE(expr) [null_treatment] over_clause
-- Returns the value of expr from the first row of the window frame.

SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall,
    LAST_VALUE(emp_no) OVER(ORDER BY salary DESC) as lowest_paid_overall
FROM employees;


-- ? LAG & LEAD FUNCTIONS

-- ? LAG(expr [, N[, default]]) [null_treatment] over_clause
-- Returns the value of expr from the row that lags (precedes) the current row by N rows within its partition. If there is no such row, the return value is default. For example, if N is 3, the return value is default for the first three rows. If N or default are missing, the defaults are 1 and NULL, respectively.

-- N must be a literal nonnegative integer. If N is 0, expr is evaluated for the current row.


-- ? LEAD(expr [, N[, default]]) [null_treatment] over_clause
-- Returns the value of expr from the row that leads (follows) the current row by N rows within its partition. If there is no such row, the return value is default. For example, if N is 3, the return value is default for the last three rows. If N or default are missing, the defaults are 1 and NULL, respectively.

-- N must be a literal nonnegative integer. If N is 0, expr is evaluated for the current row.


SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;



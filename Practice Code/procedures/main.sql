-- ? STORED PROCEDURES

-- Types of Parameters => 
-- IN => Input data, 
-- OUT => Output data (return value)

-- ? SYNTAX
-- ? IN TYPE
DELIMITER $$
CREATE PROCEDURE get_empId(IN empName VARCHAR(100))
BEGIN
    SELECT id, emp_name from employees where emp_name = empName;
END$$

DELIMITER ;


-- ? OUT TYPE
DELIMITER $$
CREATE PROCEDURE get_empId(IN empName VARCHAR(100), OUT empId INT)
BEGIN
    SELECT id INTO empId from employees where emp_name = empName;
END$$

DELIMITER ;

-- Call Procedure
SET @emp_id=0;
CALL get_empId("Hari", @emp_id);
select @emp_id;




-- ! COMMIT & ROLLBACK
-- ? Once COMMIT then can't ROLLBACK.

STATEMNTS;
COMMIT; -- CAN'T ROLLBACK ABOVE.

STATEMNTS; -- SOME UPDATE OR INSERT OR DELETE COMMANDS
ROLLBACK;  -- CAN ROLLBACK TILL PREVIOUS COMMIT;


-- It is SQL Statments that runs automatically when an event occurs;

--* SYNTAX
-- CREATE TRIGGER trigger_name
--     trigger_time    trigger_event   ON table_name FOR EACH ROW
--     BEGIN
--     ....
--     END;



-- trigger_time: BEFORE | AFTER
-- trigger_event: INSERT | UPDATE | DELETE 


-- ? BEFORE INSERT TRIGGER (age < 18 not allowed)
DELIMITER $$
CREATE TRIGGER must_be_adult
BEFORE INSERT ON users FOR EACH ROW
BEGIN
    IF  NEW.age < 18
    THEN    
        SIGNAL SQLSTATE '45000'  -- 5 DIGIT CUSTOM CODE FOR APPLICATION LOGIC 
            SET MESSAGE_TEXT = 'Must be an adult!';
    END IF;
END;
$$
DELIMITER ;

-- ? AFTER DELETE TRIGGER (capture unfollowers)

DELIMITER $$
CREATE TRIGGER capture_unfollow
AFTER DELETE ON follows FOR EACH ROW
BEGIN
    -- INSERT INTO unfollows (follower_id, followee_id) VALUES (OLD.follower_id, OLD.followee_id);
                        -- OR
    INSERT INTO unfollows 
    SET 
        follower_id = OLD.follower_id, 
        followee_id = OLD.followee_id;
END;
$$
DELIMITER ;


-- ? DROP TRIGGERS
DROP TRIGGER trigger_name;
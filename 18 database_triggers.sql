-- In users.sql
CREATE TABLE users(
  username VARCHAR(100),
  age INT
);

-- Basic Pattern Code for Triggers
DELIMITER $$

CREATE TRIGGER trigger_name
     trigger_time trigger_event ON table_name FOR EACH ROW
     BEGIN
     END;
$$

DELIMITER ;

-- Example 1 In users_trigger.sql
-- How to run this file: sournce users_trigger.sql

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

-- Example 2 preventing self-followers (instagram data)
DELIMITER $$

CREATE TRIGGER prevent_self_follow
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
        IF NEW.follower_id = NEW.followee_id
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
        END IF;
     END;
$$

DELIMITER ;

-- Example 3 logging unfollows
-- unfollow tables

CREATE TABLE unfollows(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(follower_id) REFERENCES users(id),
  FOREIGN KEY(followee_id) REFERENCES users(id),
  PRIMARY KEY(follower_id, followee_id)
);

-- in unfollow_trigger.sql

DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;

-- Managing Triggers
show triggers;
drop trigger trigger_name;




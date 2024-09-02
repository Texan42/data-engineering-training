-- create database

--bit is similar to boolean

CREATE DATABASE demo;

USE demo;

CREATE TABLE users(
	user_id int PRIMARY KEY IDENTITY,
	user_first_name VARCHAR(30) NOT NULL,
	user_last_name VARCHAR(30) NOT NULL,
	user_email_id VARCHAR(50) NOT NULL,
	user_email_validation bit DEFAULT 0,
	user_password VARCHAR(200),
	user_role VARCHAR(1) NOT NULL DEFAULT 'U',
	is_active bit DEFAULT 0,
	last_updated_ts DATETIME DEFAULT getdate()
);

-- truncate removes everything from a table, then you can insert new data.
-- if you just want to insert additional data DO NOT truncate
TRUNCATE TABLE users;

INSERT INTO users (user_first_name, user_last_name, user_email_id)
VALUES ('Scott', 'Tiger', 'scott@tiger.com');

INSERT INTO users (user_first_name, user_last_name, user_email_id)
VALUES ('Donald', 'Duck', 'donald@duck.com');

INSERT INTO users (user_first_name, user_last_name, user_email_id)
VALUES ('Mickey', 'Mouse', 'mickey@mouse.com');

INSERT INTO users
	(user_first_name, user_last_name, user_email_id, user_password, user_role, is_active)
VALUES
	('Gordan', 'Bradock', 'gbradock@barnesandnobel.com', 'h9laz7pub', 'U', 1),
	('Toby', 'Linus', 'tlinus@gmail.com', 'rgfr4783d', 'U', 1),
	('Addie', 'Masias', 'amasias@aol.com', 'f42f92f', 'U', 1);

SELECT * FROM users;

UPDATE users
	SET user_role = 'A'
where user_id = 1;

SELECT * FROM users;

SELECT count(*) from users;

-- transaction syntax
BEGIN TRANSACTION transaction1;

SAVE TRANSACTION my_savepoint;

UPDATE users
SET user_email_id = LOWER(user_email_id)
WHERE user_first_name = 'Mickey';

SELECT * FROM users;

UPDATE users
SET user_email_id = UPPER(user_email_id)
WHERE user_first_name = 'Mickey';

SELECT * FROM users;

-- revert back to previous

ROLLBACK TRANSACTION my_savepoint;

COMMIT TRANSACTION transaction1;

SELECT * FROM users;


DROP TABLE users;

SELECT * FROM users;
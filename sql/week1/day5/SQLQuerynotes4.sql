USE demo;

--IDENTITY
	-- makes a unique number
	-- when updating your file

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
	)

-- how to add primary key if not specified
CREATE TABLE users(
	user_id int IDENTITY,
	user_first_name VARCHAR(30) NOT NULL,
	user_last_name VARCHAR(30) NOT NULL,
	user_email_id VARCHAR(50) NOT NULL,
	user_email_validation bit DEFAULT 0,
	user_password VARCHAR(200),
	user_role VARCHAR(1) NOT NULL DEFAULT 'U',
	is_active bit DEFAULT 0,
	last_updated_ts DATETIME DEFAULT getdate()
	)
ALTER TABLE users
ADD CONSTRAINT pk_users_user_id PRIMARY KEY CLUSTERED (user_id)

/* foreign keys
column(s) that are used to establish link or relationship between tables


ALTER TABLE users
ADD CONSTRAINT fk_users_department_id FOREIGN KEY (department_id)
fk/pk: foreign/primary key
users: table
department_id: row
HAS TO BE IN THIS FORMAT

EXACT NUMERIC datatypes:
	BIGINT- 8 byte (not characters)
	INT- 4 bytes
	SMALLINT- 2 bytes
	TINYINT- 1 byte
	NUMERIC/DECIMAL - precision or scale
	SMALLMONEY/MONEY - currency values

APPROX NUMERIC DATATYPES:
	floats
	real float(24)

DATE and TIME DATATYPES:
	DATE - YYYY-MM-DD
	DATETIME - YYYY-MM-DD hh:mm:ss:nnn
	DATETIME2 - 24 hours YYYY-MM-DD hh:mm:ss:nnn
	DATETIMEOFFSET - datetime2 with time zone
	TIME - no timezone no date hh:mm:ss:nnnnnn

CHARACTER STRINGS:
	CHAR(n) - fixed length - not characters, it's bytes
	VARCHAR - variable length string
	TEXT

CONSTRAINTS:
	not null - cant be lacking a value
	CHECK
	DEFAULT - requiring to be filled in with predetermined value if null
	UNIQUE - no repeating values
	PRIMARY KEY
	FOREIGN KEY

clustered index vs non clustered
clustered:
	sorts physical data inside the table
	primary key constraint automatically creates clustered index
		if you have PK its clustered

non clustered:
	does not sort the data
	tables and indexes are stored in separate places
	can have multiple non-clustered indexes per tables
	no PK (PK indicates clustered)


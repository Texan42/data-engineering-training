-- created database:
	--using backup (adventureworks)
	-- created from scratch (demo)
	-- created column individually
	-- created several at the same time

-- NOW, bulk insert

CREATE DATABASE housing_db

USE housing_db;

CREATE TABLE ca_homes (
	property_id INT NOT NULL,
	longitude FLOAT,
	latitude FLOAT,
	housing_median INT,
	total_rooms INT,
	total_bedrooms INT,
	population INT,
	households INT,
	median_income FLOAT,
	median_house_value FLOAT
);

select * from ca_homes


/* bulk insert syntax
	BULK INSERT [table_name]
	FROM [path] -- (file path)
	WITH (
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2 -- (first row in a csv is just row numbers, 2nd is data)
	);
	*/

BULK INSERT ca_homes
FROM 'C:\Users\Sam\OneDrive\Skillstorm\data engineering\ca_homes.csv'
WITH(
	FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2
	);

select * from ca_homes

--other options:
-- ssms wizard
--openrowset
	--temporary not saving to table
	--used for quick analysis of a smaller dataset

ALTER TABLE ca_homes
add constraint pk_ca_homes_property_id PRIMARY KEY CLUSTERED (property_id);

select
	tc.constraint_name,
	tc.table_name,
	kcu.column_name
from
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS as tc
join
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE as kcu
	on tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE
	tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
	and tc.TABLE_NAME = 'ca_homes'


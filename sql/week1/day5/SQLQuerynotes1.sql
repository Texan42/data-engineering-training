--   <-this is how you make a note that will not run with query
-- server_name.[database_name].[schema_name].object_name

-- in most cases, you won't put the server name 
-- [database_name].[schema_name].object_name
-- ex. [AdventureWorks2022].[dbo].ErrorLog
-- unless you're dealing with the cloud and wanting to access another server

-- access a database:
-- USE database_name;
-- ex. USE AdventureWorks2022;

-- System Databases:
-- master: records all system level information
-- msdb: used by SQL server agent for scheduling alerts and jobs
-- model: used as a template
-- tempdb: holding temporary objects (tables)

-- different ways to access SQL:
-- currently using: SSMS
-- command line (cmd): sqlcmd (in terminal) / exit: ctrl+c
	-- flags:
	-- -A dedicated administrator connection
	-- -d database name
	-- -i input file
	-- -l login timeout
	-- -o output file
	-- -P password
	-- -q cmdline query
	-- -Q cmdline query and exit
	-- -U login id/username
	-- -S [protocol].server[instance_name-[port]]
	-- -? check version of the utility

	-- ex. sqlcmd -S <server_name> -U <username> -P <password>
-- jupyter notebook / vs code

-- configuration of sql server manager
-- update protocols- enable YES, update ip14- enable YES

-- create connection between python and sql
-- creating connection
	-- conn = pymysql.connect(server='server_name', user='user_name', password='password', database='database_name')
-- telling cursor where to point using connection we created
	-- cursor= conn.cursor()
-- telling python what our query is
	-- cursor.execute("Select * from information_schema.tables")

-- access controls:
-- server level
	--sql server authentication
	-- windows authentication *default
	-- server role
	-- azure AD

-- database user:
	-- admin: [schema_dbo] can assign roles to users
	-- users:

-- ways to allow those permissions:
	-- DCL- data control language
		-- GRANT, REVOKE, DENY <-- permission that can be set by admin

-- Server Level Permissions:
	-- Control: give ownership like capabilities
	-- Alter: gives ability to change properties, except ownership- alter tables or databases
	-- Take Ownership: enable the person to take ownership of a specific securable
	-- impersonate: ability to impersonate a login- IT person
	-- create- gives the ability to create server or schema
	-- view definition: access the metadata within
	--reference: permission on a table (need that to create any foreign keys)

-- Best Practices:
	-- grant permission to role rather than a specific user
	-- switch out the users/members of the role
	-- configure our securables to be owned by the schema and grant permissions to the schema
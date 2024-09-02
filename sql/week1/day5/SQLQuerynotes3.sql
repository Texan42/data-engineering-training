-- database operations
-- transactions
-- normalization
-- table relationships
-- CRUD applications

/*
DDL- data definition language
- create, alter, drop, tables
- create, alter, drop, indexes
- add constraints to table
- create, alter, drop 'views'
- truncate

DML- data manipulation language
- insert new data into the table
- update existing data in a table
- delete existing data from a table

TCL- transaction control language
- commit
- rollback
- etc
Transactions:
- commit: persists the changes in database
- rollback: reverts uncommitted changes in the database

Normalization:
- NF1
- 2NF
- 3NF

Table relationships:
- enforced using keys

- 1 to 1- passport to citizen
each citizen has 1 unique passport

- 1 to many: mother to child
each mother can have many children
each child can have one mother

- many to 1: employees to departments
many employees can work in 1 department
but an employee can work in 1 department

- many to many: students and classes
student can take many classes
class can have many students

steps:
- identify entities and relationships from project requirement (from supervisor)
- create ER diagram- logical data model (another word for ERD)
- apply normalization steps
- determine and generate scripts from DDL

CRUD:
- Create: (insert)
- Read: (select)
- Update: (update)
- Delete: (delete)
	- truncate- removes the items within a table
*/
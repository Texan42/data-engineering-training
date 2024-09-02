create database assignment_1

use assignment_1

-- categories table
create table categories
(
	category_id int,
	category_department_id int,
	category_name varchar (50)
)

select * from categories

BULK INSERT categories
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\categories.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)

--customers table
create table customers
(
	customer_id int,
	customer_fname varchar(50),
	customer_lname varchar (50),
	customer_email varchar (50),
	customer_password varchar (50),
	customer_street varchar (50),
	customer_city varchar (50),
	customer_state varchar (50),
	customer_zipcode int
)

select * from customers

BULK INSERT customers
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\customers.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)

--deparments table
create table departments
(
	department_id int,
	department_name varchar(50)
)

select * from departments

BULK INSERT departments
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\departments.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)

--order_items table
create table order_items
(
	order_item_id int,
	order_item_order_id int,
	order_item_product_id int,
	order_item_quantity int,
	order_item_subtotal float,
	order_item_product_price float
)

select * from order_items

BULK INSERT order_items
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\order_items.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)

--orders table
create table orders
(
	order_id int,
	order_date datetime,
	order_customer_id int,
	order_status varchar(50)
)

select * from orders

BULK INSERT orders
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\orders.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)

--products table
drop table products
create table products
(
	product_id int,
	product_category_id int,
	product_name varchar(100),
	product_description varchar(100),
	product_price float
)

select * from products

BULK INSERT products
from 'C:\Users\Sam\Documents\SQL Server Management Studio\assignments\assignment 1\products.csv'
with(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
)
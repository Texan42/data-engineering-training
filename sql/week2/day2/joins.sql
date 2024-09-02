/* transactions
- filtering data
- performing aggregations
- joins
- sort
- ranking

- product and order have relationship

relationships in our db
- 1:M- orders and order_items
- 1:M- products and order_items
- 1:M- customers and orders
- 1:M- departments and categories
- 1:M- categories and products

order table & products table
*/
use assignment_1

select * from information_schema.tables
where table_catalog = 'assignment_1'

select top 10 order_customer_id, order_status, order_status
from orders

-- force the format of the column you're requesting
select top 10 order_customer_id,
	format (order_date, 'yyyy-MM'),
	order_status
from orders

-- convert
select top 10 order_customer_id,
	convert(varchar(7), order_date, 120),
	order_status
from orders

select top 10 order_customer_id,
	format(order_date, 'yyyy-MM') as order_month,
	order_status
from orders

/* filtering out data
- WHERE clause - used to filter our data
- comparison operators in sql
	- =, !=, >, <, >=, <= etc

DISTINCT - this will give you unique values
- in python(unique, or nunique)

LIKE
	- use wildcards with this
	- % == wildcard
	- anything that includes that character you're asking for
	- ex: 'a%' - starts with a, '%a' - ends with a, '%a% - an a in the name

booleans: use these to meet a condition
	- OR
	- AND

between with an and-- 'BETWEEN 10 and 20'

IS NULL and IS NOT NULL- compare against null values
*/

select top 10 * from orders
where order_status = 'COMPLETE';

select distinct order_status
from orders

select top 10 * from orders
where order_status IN ('COMPLETE', 'CLOSED')

select top 10 * from orders
where order_status = 'COMPLETE' or order_status = 'CLOSED'

select top 3 * from orders
where format(order_date, 'yyyy-MM-dd') like '2014-01%'

select top 10 * from orders
where order_status in ('COMPLETE', 'CLOSED')
	and format(order_date, 'yyyy-MM') = '2014-01';


	-- check for nulls
	-- python syntax: df.isnull().sum()-- how many nulls we have

select count(*) from orders
where order_date is NULL

select count(*) from orders
where order_date is not null


-- JOINS
-- INNER JOIN- get all the records from both datasets on the column that you request (relationships matter)
-- OUTER JOIN- will get columns not in common
-- join on.. whatever column you have a relationship with
-- LEFT OUTER(default if not specified)- all the records from both datasets which specify on the join condition to left table

select top 10  o.order_id,
	o.order_date,
	o.order_status,
	oi.order_item_order_id,
	oi.order_item_subtotal
from orders o JOIN order_items oi
	on o.order_id = oi.order_item_order_id
order by o.order_id;


--LEFT JOIN

select top 10 o.order_id,
	o.order_date,
	o.order_status,
	oi.order_item_order_id,
	oi.order_item_subtotal
from orders o LEFT OUTER JOIN order_items oi
	on o.order_id = oi.order_item_order_id
order by o.order_id


--RIGHT OUTER JOIN

select top 10 o.order_id,
	o.order_date,
	o.order_status,
	oi.order_item_order_id,
	oi.order_item_subtotal
from order_items oi RIGHT OUTER JOIN orders o
	on o.order_id = oi.order_item_order_id
order by o.order_id


/* aggregations
ex:
- total number of orders
- revenue given order id
- number of completed orders

--GROUP BY
- get number of orders by date
- revenue for each order_id
-get daily product
-RULES:
- whatever is in group by has to be in select clause

--ORDER OF OPERATIONS
SELECT, FROM, WHERE, GROUP BY


--HAVING clause
- apply additional filters to our data

*/

select count(order_id) from orders

select count(distinct order_date) from orders

select round(sum(order_item_subtotal), 2) as order_revenue
from order_items
where order_item_order_id = 2

--GROUP BY
select top 10 order_date,
count(*)
from orders
group by order_date
order by order_date

select top 10 order_item_order_id,
	sum(order_item_subtotal) as order_revenue
from order_items
group by order_item_order_id

/*
--ORDER OF OPERATIONS: has to be in this order
-- select
-- from
-- where
-- group by or having
-- order by

select order_date, count(*) as order_count
from orders
where order_status in ('COMPLETE', 'CLOSED')
group by order_date
having count(*) > 50
order by order_count desc;
*/

select top 10 * from orders
order by order_customer_id

select top 10 * from orders
order by order_customer_id desc

--chained together everything we learned about
-- cast, round, sum
-- join, where, group by, having, order by
select o.order_date,
	oi.order_item_product_id,
	round(sum(cast(oi.order_item_subtotal as numeric)), 2) as revenue
from orders o
JOIN order_items oi
	on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by o.order_date,
	oi.order_item_product_id
having round(sum(cast(oi.order_item_subtotal as numeric)),2) >= 1000
order by o.order_date,
	revenue desc
use assignment_1

/*Views
- virtual tables based on a query
- can find the table in schema
- doesnt actually save the data, just refers to the table you call in your query
- makes it easier to have complex queries by encapsulating them into a single, reusable object (table)
- it can be referenced by other users
*/

create view orders_v as
select * from orders

update orders_v
set order_status = LOWER(order_status)

select top 10 * from orders
select top 10 * from orders_v

update orders_v
set order_status = upper(order_status)

create view order_details_v
as
select * from orders o
	join order_items oi
	on o.order_id = oi.order_item_order_id

select top 10 order_date,
	order_item_product_id,
	round(sum(order_item_subtotal),2) as revenue
from order_details_v
group by order_date,
order_item_product_id
order by order_date,
revenue desc



-- with clauses
with order_details_nq AS(
	select * from orders o
	join order_items oi
	on o.order_id = oi.order_item_order_id
) select top 10 * from order_details_nq






-- CATCH UP IN VID



-- select * into (new table name) from (original table)
select * into customer_backup from customers

select top 10 from customer_backup

select order_id,
	format(order_date, 'yyyy') as order_year,
	format(order_date, 'MM') as order_month,
	format(order_date, 'dd') as order_day_of_month,
	datepart(dayofyear, order_date) as order_day_of_year,
	order_customer_id,
	order_status
into order_backup
from orders

select top 10 * from order_backup

-- cta (select into)- do save the data
-- views- dont save data in it- reference the table you called
-- with clauses- only within the query can'y reference later

drop table if exists customer_backup;
drop table if exists order_backup;
drop table if exists order_items_empty;









create table customer_order_metrics_mthly(
	customer_id INT NOT NULL,
	order_month CHAR(7) NOT NULL,
	order_count INT,
	order_revenue FLOAT
	)


Alter table customer_order_metrics_mthly
	add primary key (order_month, customer_id)

select top 10 o.order_customer_id,
	format(o.order_date, 'yyyy-MM') as order_month,
	count(1) as order_count,
	round(sum(order_item_subtotal),2) as order_revenue
from orders o
	join order_items oi
	on o.order_id = oi.order_item_order_id
group by o.order_customer_id,
	format(o.order_date, 'yyyy-MM')
order by order_month,
	order_count desc






-- pivot tables
-- makes it more human readable
-- helps make comparisons between columns

use AdventureWorks2022

select DaysToManufacture, AVG(StandardCost) as AverageCost
from Production.Product
group by DaysToManufacture

SELECT 'AverageCost' AS Cost_Sorted_By_Production_Days,   
  [0], [1], [2], [3], [4]  
FROM  
(
  SELECT DaysToManufacture, StandardCost   
  FROM Production.Product
) AS SourceTable  
PIVOT  
(  
  AVG(StandardCost)  
  FOR DaysToManufacture IN ([0], [1], [2], [3], [4])  
) AS PivotTable;
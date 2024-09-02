/*
using assignment_1

- retrieve top 50
- show me order_date, product_ID, product_name, total_revenue
-- total revenue for each product
- complete and closed (order_status)
- group results by order_date and product
-- calculate total revenue for each product per day
-- order by order_date, and revenue desc
*/

use assignment_1

select top 50 o.order_date,
	p.product_id,
	p.product_name,
	round(sum(oi.order_item_subtotal), 2) as order_revenue
from orders o 
join order_items oi on o.order_id = oi.order_item_order_id
join products p on oi.order_item_product_id = p.product_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by o.order_date, p.product_name, p.product_id
order by o.order_date, order_revenue desc



select * from products, orders, order_items
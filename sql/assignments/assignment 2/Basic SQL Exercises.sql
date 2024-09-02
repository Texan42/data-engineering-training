use assignment_1

-- #1
select * from categories

-- #2
select product_name, product_price from products

--#3
select * from products
where product_price > 100
order by product_price desc

--#4
select * from customers
where customer_lname = 'Jones'

--#5
select count(*) from orders

--#6
select round(AVG(product_price),2 ) from products
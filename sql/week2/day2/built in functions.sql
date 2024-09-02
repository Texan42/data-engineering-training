/*
BUILT IN FUNCTIONS
aggregate functions
- AVG
- COUNT
- MAX
- MIN
- SUM
- STDEV (standard deviation
- VAR (variance)
- STRING_AGG
- APPROX_COUNT_DISTINCT- not exact count but pretty close


cast datatypes
conversions
- convert
- cast

*if sql is unable to it wil return a null
- try_cast
- try_convert
- try_parse

syntax
cast ( expression as data_type[(length)]
convert(data_type[length], expression [,style])
*/

select cast(10.6496 as int) as trunc1,
	cast(-10.4453 as int) as trunc2,
	cast(10.6344 as numeric) as round1,
	cast(-10.6131 as numeric) as round2

use AdventureWorks2022

select substring(name, 1, 30) as ProductName,
	ListPrice
from Production.Product
where cast(ListPrice as int) like '33%'

set dateformat mdy

select try_cast('12/31/2022' as datetime2) as result

set dateformat dmy
select TRY_CAST('12/31/2022' as datetime2) as result

select
case when try_cast('test' as float) is null
	then 'Cast Failed'
	else 'Cast Succeeded'
end as result

/* 
date and time functions

Very specific or high precision
- sysdatetime()- gives datetime2(7) -- 7 being the length
- sysdatetimeoffset()- datetimeoffset(7)
- sysutcdatetime() - include utc

less specific / low precision
- current_timestamp - datetime
- getdate() - datetime
- getutcdate() - include utc
*/

-- all the way to nanosecond
select sysdatetime()

select SYSDATETIMEOFFSET()

select CURRENT_TIMESTAMP

select GETDATE()

select GETUTCDATE()

select convert(date, getdate()) as CurrentDate












use assignment_1

select top 3 datename(year, order_date) from orders
select top 3 datename(month, order_date) from orders
select top 3 datename(day, order_date) from orders

select top 3 datepart(month, order_date) from orders

select top 3 datetrunc(day, order_date) from orders

select top 3 datetrunc(month, order_date) from orders

select top 3 day(order_date), month(order_date), year(order_date) from orders

select DATEFROMPARTS(2022,07,04)

select TIMEFROMPARTS(12,31,45,0,4)


-- altering dates

select datediff(day, min(order_date), max(order_date)) from orders

-- adding days to a date

select top 3 order_date, DATEADD( day, 3, order_date) from orders
select top 3 order_date, DATEADD( month, 3, order_date) from orders
select top 3 order_date, DATEADD( year, 3, order_date) from orders

-- end of month
select top 3 order_date, EOMONTH(order_date) from orders


-- STRING FUNCTIONS
-- concat (add together)
-- difference
-- string manipulation --lower, upper, etc

select len('hEllo wOrlD') as result

select lower('hEllo wOrlD') as lower_result, upper('hEllo wOrlD') as upper_result

select right('123 456 7890', 3) as r_results, left('123 456 7890', 3) as l_result

select substring('123 456 7890', 5, 3) as result_substring

select * from string_split('I love skillstorm de courses', ' ')


-- concat - adding together strings

select concat('hello', ' ', 'world') as result

use assignment_1

select top 10 concat('Order status is ', lower(order_status), '.') as result from orders

select CONCAT_WS(' ', 'Hello', 'how', 'are', 'you?')

select CONCAT_WS('-', '2024', '08', '06')


-- difference - tells you how much two strings have in common
-- works on a scale, not characters
-- 0 = nothing in common
-- 4 = does have common items/patterns

select DIFFERENCE('computer', 'computation')

select difference('apples', 'oranges')

select difference('a', 'b')

select difference('rgynfghe', 'b')

select LTRIM('   hello world        ') as result
select RTRIM('   hello world       ') as result
select TRIM('   hello world      ') as result

select replace('Hello World', 'hello', 'goodbye')

select REPLICATE('hey ', 3)


-- logical functions
-- choose
-- IIF

select *, CHOOSE(month(order_date),
	'Winter',
	'Winter',
	'Winter',
	'Spring',
	'Spring',
	'Spring',
	'Summer',
	'Summer',
	'Summer',
	'Autumn',
	'Autumn',
	'Autumn') as Season
From orders

select *, IIF(order_item_subtotal > 200, 'expensive', 'cheap') as expense_type from order_items


use AdventureWorks2022

select ProductNumber,
	ProductLine,
	Categories = CASE ProductLine
		WHEN 'R' THEN 'Road'
		WHEN 'M' THEN 'Mountain'
		WHEN 'T' THEN 'Touring'
		WHEN 'S' THEN 'Other sales item'
		ELSE 'NOT for sale'
		END,
	name
from Production.Product
order by ProductNumber
--create table orders (
--[order_id] int primary key
--,[order_date] date
--,[ship_mode] varchar(20)
--,[segment] varchar(20)
--,[country] varchar(20)
--,[city] varchar(20)
--,[state] varchar(20)
--,[postal_code] varchar(20)
--,[region] varchar(20)
--,[category] varchar(20)
--,[sub_category] varchar(20)
--,[product_id] varchar(50)
--,[quantity] int
--,[discount] decimal (7,2)
--,[sale_price] decimal (7,2)
--,[profit] decimal(7,2))
---------------------------------------------------------
select * from orders
---------------------------------------------------------
--find top 10 highest reveue generating products
select TOP 10 product_id,SUM(sale_price) total_sum
from orders
group by product_id
order by total_sum desc
---------------------------------------------------------
--find top 5 highest selling products in each region
with cte as(
select region, product_id, SUM(sale_price) total_sales
,rank()over(partition by region order by SUM(sale_price) desc) rank
from orders  
group by region,product_id)
select region, product_id,total_sales
from cte
where rank<6
---------------------------------------------------------
--find month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023
with cte as(
select year(order_date)oyear,month(order_date)omonth,SUM(sale_price) sales
from orders
group by year(order_date),month(order_date))

select omonth as month
,sum(case when oyear=2022 then sales  else 0 end) as sales_2022
,sum(case when oyear=2023 then sales else 0 end) as sales_2023
from cte
group by omonth
order by omonth
---------------------------------------------------------
--for each category which month had highest sales
select * from orders
--with cte as(
--select category,month(order_date) month, sum(sale_price) sales
--,rank()over(partition by category order by sum(sale_price) desc) rank
--from orders
--group by category,month(order_date)
--order by category,month(order_date))

--select category, month numeric_month,sales monthly_sales
--from cte
--where rank=1

with cte as (
select category, format(order_date, 'yyyyMM') as date_year_month,
sum(sale_price) as sales
from orders
group by category, format(order_date, 'yyyyMM'))

select category,date_year_month,sales total_sales
from (
		select *,
		row_number() over (partition by category order by sales desc) as rn
		from cte
	 ) a
		where rn=1
---------------------------------------------------------
--which sub category had highest growth by profit in 2023 compare to 2022
select * from orders 
with cte as (
select sub_category,year(order_date) year,sum(profit) total_profit
from orders
group by sub_category,year(order_date))
--order by sub_category,year(order_date))
,cte2 as(
select sub_category
,SUM(case when year=2022 then total_profit else 0 end )as profit_22
,SUM(case when year=2023 then total_profit else 0 end )as profit_23
,SUM(case when year=2022 then total_profit else 0 end ) - SUM(case when year=2023 then total_profit else 0 end )as sale_diff
,rank()over(order by SUM(case when year=2022 then total_profit else 0 end ) - SUM(case when year=2023 then total_profit else 0 end )) rn
from cte
group by sub_category)

select sub_category,sale_diff
from cte2
where rn =1
# Write your MySQL query statement below
with all_sales as(
select product_id,year,quantity,price,dense_rank() over(partition by product_id order by year) as rnk from Sales)
select product_id,year as first_year,quantity,price from all_sales where rnk=1 group by 1,2,3,4
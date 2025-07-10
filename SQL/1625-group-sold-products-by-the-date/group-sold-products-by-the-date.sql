# Write your MySQL query statement below
with dist_products as(
select distinct sell_date,product from Activities)
select sell_date,count(*) as num_sold,group_concat(product order by product) as products from dist_products group by sell_date order by sell_date
# Write your MySQL query statement below
with customer_prd as(
select customer_id,count(distinct product_key) as prod_cnt from Customer group by 1)
select customer_id from customer_prd where prod_cnt in(select count(product_key) as cnt from Product)

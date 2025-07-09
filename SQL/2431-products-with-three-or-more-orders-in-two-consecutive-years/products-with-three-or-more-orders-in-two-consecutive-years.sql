# Write your MySQL query statement below
with year_wise_prd_cnt as(
    select year(purchase_date) as yar,product_id,count(order_id) as orders_cnt from Orders group by year(purchase_date),product_id having count(order_id)>=3
),
products_diff as(
select product_id,orders_cnt,yar,yar-row_number() over(partition by product_id order by yar) as diff from year_wise_prd_cnt),
same_products as(
select p1.product_id from products_diff p1 join products_diff p2 on p1.product_id=p2.product_id and p1.yar!=p2.yar
and p1.diff=p2.diff
)
select distinct product_id from same_products
# Write your MySQL query statement below

select product_name,product_id,order_id,order_date from(
select o.order_id,o.order_date,o.product_id,p.product_name,rank() over(partition by product_id order by order_date desc) as rnk from Orders o join Products p on o.product_id=p.product_id)a where rnk=1 order by product_name,product_id,order_id
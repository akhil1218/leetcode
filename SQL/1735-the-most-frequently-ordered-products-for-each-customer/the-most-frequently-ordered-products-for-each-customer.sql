# Write your MySQL query statement below
select product_id,product_name,customer_id from(
select customer_id,p.product_id,p.product_name,count(order_id) as num_orders,rank() over(partition by customer_id order by count(order_id) desc) as rnk from Orders o join Products p on o.product_id=p.product_id group by customer_id,p.product_id,p.product_name
)a where rnk=1
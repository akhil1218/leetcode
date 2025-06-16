# Write your MySQL query statement below

select name as customer_name,customer_id,order_id,order_date from(
select *,row_number() over(partition by customer_id order by order_date desc) as rn from(
select c.customer_id,name,order_id,order_date from Customers c join Orders o on c.customer_id=o.customer_id)a)b Where rn<4 order by customer_name,customer_id,order_date desc
# Write your MySQL query statement below
with temp as(select customer_id, order_date,customer_pref_delivery_date from(
select customer_id, order_date,customer_pref_delivery_date,rank() over(partition by customer_id order by order_date) as rnk from Delivery)a where rnk=1)
select round(count(distinct customer_id)*100/(select count(distinct customer_id) from Delivery),2) as immediate_percentage from temp where order_date=customer_pref_delivery_date
# Write your MySQL query statement below
with first_orders as(
select customer_id,min(order_date) as first_date,min(customer_pref_delivery_date) as cust_first_date from Delivery group by customer_id)
select round(((count(*))/(select count(*) from first_orders))*100,2) as immediate_percentage  from first_orders where first_date=cust_first_date
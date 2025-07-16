# Write your MySQL query statement below
with all_prod as(
select s.product_id,s.user_id,sum(quantity*price) as total from Sales s join Product p on s.product_id=p.product_id group by 1,2)
select user_id,product_id from(
select user_id,product_id, rank() over(partition by user_id order by total desc) as rnk from all_prod) a where rnk=1
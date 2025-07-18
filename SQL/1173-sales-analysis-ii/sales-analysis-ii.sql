# Write your MySQL query statement below
with temp as(
select buyer_id,p.product_name from Sales s join Product p on s.product_id=p.product_id)
select distinct buyer_id from temp where product_name='S8' and buyer_id not in(
select buyer_id from temp where product_name='iPhone')
# Write your MySQL query statement below
with temp as(
select p.product_id,p.new_price as price from Products p join(
select product_id,max(change_date) as latest from Products where change_date<='2019-08-16' group by 1) a on p.product_id=a.product_id and p.change_date=a.latest),
temp2 as(
select distinct product_id from Products)
select t1.product_id,coalesce(price,10) as price from temp2 t1 left join temp t2 on t1.product_id=t2.product_id

# Write your MySQL query statement below
select product_id,max(average_price) as average_price from(
select product_id,0 as average_price from Prices group by 1
union all
select p.product_id,ifnull(round((sum((units*price))/sum(units)),2),0) as average_price from Prices p join UnitsSold u on p.product_id=u.product_id where purchase_date between start_date and end_date group by 1) a group by 1
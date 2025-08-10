# Write your MySQL query statement below
with orders_brands as(
select seller_id,item_brand,count(1) over(partition by seller_id order by order_date) as cnt from Orders o join Items i on o.item_id=i.item_id)
select user_id as seller_id,case when seller_id is null then "no" else "yes" end as "2nd_item_fav_brand" from Users u left join orders_brands ob on u.user_id=ob.seller_id and item_brand=favorite_brand and cnt=2
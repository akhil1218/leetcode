# Write your MySQL query statement below
select product_name,unit from(
select product_id,sum(unit) as unit from Orders where date_format(order_date,'%Y-%m')='2020-02'group by product_id having sum(unit)>=100) a join Products p on a.product_id=p.product_id
# Write your MySQL query statement below

select person_name from(
select Turn,person_name,sum(weight) over(order by turn) as total_weight from Queue) a where total_weight<=1000 order by turn desc limit 1

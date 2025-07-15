# Write your MySQL query statement below
select person_name from(
select person_name,sum(weight) over(order by turn) as roll_sum from Queue)a where roll_sum<=1000 order by roll_sum desc limit 1
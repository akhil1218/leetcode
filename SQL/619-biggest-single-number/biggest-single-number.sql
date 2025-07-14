# Write your MySQL query statement below
select max(num) as num from(
select num,count(*) as num_cnt from MyNumbers group by 1 having count(*)=1 order by num desc limit 1)a
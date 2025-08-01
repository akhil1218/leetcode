# Write your MySQL query statement below
-- with temp as(
-- select num,(id-row_number() over(partition by num order by id)) as rn from Logs)
-- select distinct num as ConsecutiveNums from temp group by num,rn having count(*)>=3
select distinct a.num as ConsecutiveNums from
(select l1.id,l1.num from Logs l1 join Logs l2 on l1.num=l2.num and l1.id+1=l2.id)a join Logs l3 on a.num=l3.num and a.id+2=l3.id
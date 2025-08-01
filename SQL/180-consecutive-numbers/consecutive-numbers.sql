# Write your MySQL query statement below
with temp as(
select num,(id-row_number() over(partition by num order by id)) as rn from Logs)
select distinct num as ConsecutiveNums from temp group by num,rn having count(*)>=3
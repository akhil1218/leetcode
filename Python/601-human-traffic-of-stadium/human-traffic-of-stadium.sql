# Write your MySQL query statement below

with temp as(
select id,(id-row_number() over(order by id,visit_date)) as rn,visit_date,people from Stadium where people>=100),
temp2 as(
    select rn from temp group by rn having count(*)>=3
)
select id,visit_date,people from temp where rn in(select rn from temp2)
# Write your MySQL query statement below
select id,case when id%2=0 then pre_st
when id%2=1 and id in(select max(id) from Seat) then student
else nxt_st end as student from(
select id,student,lead(student) over(order by id) as nxt_st,lag(student) over(order by id) as pre_st from Seat)a order by 1
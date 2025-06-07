# Write your MySQL query statement below
with all_details as(
select id,student,lead(id) over(order by id) as next_id,lag(id) over(order by id)as last_id from Seat)
select case when id%2=0 then last_id when id%2=1 and next_id is null then id when id%2=1 then next_id end as id,student from all_details order by 1
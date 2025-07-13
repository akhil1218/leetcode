# Write your MySQL query statement below
with friends_list as(
select requester_id as id from RequestAccepted
UNION ALL
select accepter_id as id from RequestAccepted)
select id,count(*) as num from friends_list group by id order by num desc limit 1
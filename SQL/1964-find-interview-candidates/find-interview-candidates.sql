# Write your MySQL query statement below
with temp as(
select contest_id,gold_medal as user_id,'gold' as medal from Contests
union all
select contest_id,silver_medal as user_id,'silver' as medal from Contests
union all
select contest_id,bronze_medal as user_id,'bronze' as medal from Contests),
temp2 as(
    select user_id,ct from(
    select user_id,contest_id-row_number() over(partition by user_id order by contest_id) as ct from temp) a group by user_id,ct having count(*)>=3
),
temp3 as(
select user_id from temp where medal='gold' group by user_id having count(*)>=3
union all
select user_id from temp2
)
select name,mail from Users u join temp3 t on u.user_id=t.user_id group by 1,2




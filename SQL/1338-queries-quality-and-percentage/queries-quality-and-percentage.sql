# Write your MySQL query statement below
select query_name,round((sum(quality)/count(*)),2) as quality,round((count(poor_query_percentage)/count(*))*100,2) as poor_query_percentage from(
select query_name,rating/position as quality,case when rating<3 then 1 else null end as poor_query_percentage from Queries) a group by query_name
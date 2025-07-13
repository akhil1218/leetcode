# Write your MySQL query statement below
with temp as(
select host_team as team_id,case when host_goals>guest_goals then 3
when host_goals=guest_goals then 1
else 0 end as num_points from Matches
union all
select guest_team as team_id,case when guest_goals>host_goals then 3
when host_goals=guest_goals then 1
else 0 end as num_points from Matches)
select t1.team_id,team_name,ifnull(sum(num_points),0) as num_points from Teams t1 left join temp t2 on t1.team_id=t2.team_id group by team_id,team_name order by num_points desc,team_id
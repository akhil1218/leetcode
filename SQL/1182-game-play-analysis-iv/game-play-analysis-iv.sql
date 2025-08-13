# Write your MySQL query statement below
with groups2 as(
select player_id, event_date,date_sub(event_date,Interval row_number() over(partition by player_id order by event_date) day) as grp,games_played from Activity),
inital_players as(
select player_id from(
select player_id,dense_rank() over(partition by player_id order by grp) as rnk from groups2)a where rnk=1 group by player_id having count(*)>1)
select round(count(player_id)/(select count(distinct player_id) from Activity),2) as fraction from inital_players
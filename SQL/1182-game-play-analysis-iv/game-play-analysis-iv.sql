# Write your MySQL query statement below
with players_grp as(
select player_id,event_date,date_sub(event_date,Interval row_number() over(partition by player_id order by event_date) day) as dif from Activity),
players_fdate as(
select player_id,dif,min(event_date) as first_date from players_grp group by player_id,dif having count(*)>1),
player_mindate as(
    select player_id,min(event_date) as first_date from Activity group by 1
)
select round((count(*)*1.0/(select count(distinct player_id) from Activity)),2) as fraction from players_fdate pf join player_mindate pm on pf.player_id=pm.player_id and pf.first_date=pm.first_date

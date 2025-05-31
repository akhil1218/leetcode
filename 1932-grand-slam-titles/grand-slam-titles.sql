# Write your MySQL query statement below
with temp as(
select year,Wimbledon as games from Championships
union all
select year,Fr_open as games from Championships
union all
select year,US_open as games from Championships
union all
select year,Au_open as games from Championships)
select player_id,player_name,grand_slams_count from
(select games,count(*) as grand_slams_count from temp group by 1)a join Players p on a.games=p.player_id


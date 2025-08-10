# Write your MySQL query statement below
with player_groups as(
select match_id,first_player,second_player,first_score,second_score,group_id from Matches m join Players p on m.first_player=p.player_id),
total_scores as(
select first_player as player_id,first_score as score,group_id from player_groups 
union all
select second_player as player_id,second_score as score,group_id from player_groups)
select group_id,player_id from(
select group_id,player_id,sum(score) as scores,row_number() over(partition by group_id order by sum(score) desc, player_id) as rnk from total_scores group by group_id,player_id) a where rnk=1
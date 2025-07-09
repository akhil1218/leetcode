# Write your MySQL query statement below
with first as(
select first_col,row_number() over(order by first_col) as ordr from Data),
second as(
select second_col,row_number() over(order by second_col desc) as ordr from Data)
select first_col,second_col from first f join second s on f.ordr=s.ordr order by 1, 2 desc
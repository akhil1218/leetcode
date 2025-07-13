# Write your MySQL query statement below
select id from(
select id,recordDate as current_day,temperature as current_temp,lag(recordDate,1) over(order by recordDate) as prev_day,lag(temperature,1) over(order by recordDate) as prev_temp from Weather)a where current_temp>prev_temp and datediff(current_day,prev_day)=1
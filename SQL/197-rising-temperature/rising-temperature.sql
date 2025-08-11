# Write your MySQL query statement below
select id from(
select id,recordDate,temperature,lag(recordDate) over(order by recordDate) as pre_day,lag(temperature) over(order by recordDate) as prev_day from Weather) a where temperature>prev_day and recordDate=date_add(pre_day, Interval 1 day)
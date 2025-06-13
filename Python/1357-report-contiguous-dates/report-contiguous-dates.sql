# Write your MySQL query statement below
with temp as(
select fail_date,date_sub(fail_date,Interval rn day) as failed_grp from(
select fail_date, row_number() over(order by fail_date) as rn from Failed where fail_date between '2019-01-01' and '2019-12-31')a),
temp2 as(
select failed_grp from temp group by failed_grp having count(*)>=1),
temp3 as(
    select  success_date,date_sub( success_date,Interval rn day) as success_grp from(
select success_date, row_number() over(order by success_date) as rn from Succeeded where success_date between '2019-01-01' and '2019-12-31')a
),
temp4 as(
select success_grp from temp3 group by success_grp having count(*)>=1)
select period_state,start_date,end_date from(
select * from(
select 'failed' as period_state,failed_grp,min(fail_date) as start_date,max(fail_date) as end_date from temp group by period_state,failed_grp having failed_grp in(select failed_grp from temp2))a
union all
select * from(
select 'succeeded' as period_state,success_grp,min(success_date) as start_date,max(success_date) as end_date from temp3 group by period_state,success_grp having success_grp in(select success_grp from temp4))b)c order by start_date

# Write your MySQL query statement below
with failed_dates as(
select fail_date,date_sub(fail_date,Interval rn day) as failed_grp from(
select fail_date, row_number() over(order by fail_date) as rn from Failed where fail_date between '2019-01-01' and '2019-12-31')a),
successive_dates as(
    select  success_date,date_sub( success_date,Interval rn day) as success_grp from(
select success_date, row_number() over(order by success_date) as rn from Succeeded where success_date between '2019-01-01' and '2019-12-31')a
)
select period_state,start_date,end_date from(
select 'failed' as period_state,failed_grp,min(fail_date) as start_date,max(fail_date) as end_date from failed_dates group by period_state,failed_grp
union all
select 'succeeded' as period_state,success_grp,min(success_date) as start_date,max(success_date) as end_date from successive_dates group by period_state,success_grp)c order by start_date

# Write your MySQL query statement below
with process_details as(
select machine_id,process_id,(sum(case when activity_type='end' then timestamp end)-sum(case when activity_type='start' then timestamp end)) as dif from Activity group by machine_id,process_id)
-- select * from process_details
select machine_id,round((sum(dif)/count(process_id)),3) as processing_time from process_details group by machine_id
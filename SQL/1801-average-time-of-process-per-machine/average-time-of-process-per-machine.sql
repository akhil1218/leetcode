# Write your MySQL query statement below
with time_took as(
    select machine_id,process_id,max(case when activity_type='end' then timestamp end)-max(case when activity_type='start' then timestamp end) as time_taken from Activity group by machine_id,process_id
)
select machine_id,round(avg(time_taken),3) as processing_time from time_took group by machine_id
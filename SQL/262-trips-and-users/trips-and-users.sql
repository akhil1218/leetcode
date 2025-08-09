with banned_users as(
select users_id from Users where banned='yes'),
total_values as(
select client_id,driver_id,case when status="cancelled_by_driver" or status="cancelled_by_client" then 1 else 0 end cancelled_flag ,request_at from(
select client_id,driver_id,status,users_id,request_at from Trips t left join banned_users b on t.client_id=b.users_id or t.driver_id=b.users_id) a where users_id is null and request_at>='2013-10-01' and request_at<='2013-10-03')
select request_at as Day,round(sum(cancelled_flag)/count(*),2) as "Cancellation Rate" from total_values group by request_at

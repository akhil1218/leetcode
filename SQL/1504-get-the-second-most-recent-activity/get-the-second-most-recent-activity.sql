# Write your MySQL query statement below
with rnk_user as(
select username,activity,startDate,endDate,dense_rank() over(partition by username order by startDate desc) as rnk from UserActivity)

select username,activity,startDate,endDate from rnk_user where rnk=2
union all
select username,activity,startDate,endDate from rnk_user where rnk=1 and username not in(select username from rnk_user where rnk=2)
# Write your MySQL query statement below

with dont_include as(
select id,max(month) as not_include from Employee group by id),
exclude_max as(
select e.* from Employee e left join dont_include d on e.id=d.id and e.month=d.not_include where d.id is null),
arrange as(
    select *,(month-row_number() over(partition by id order by month)) as rn from exclude_max
)
select id,month,sum(salary) over(partition by id,rn order by month desc ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) as Salary from arrange order by 1,2 desc
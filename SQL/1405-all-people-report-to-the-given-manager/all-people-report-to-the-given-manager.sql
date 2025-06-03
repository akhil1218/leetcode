# Write your MySQL query statement below

with recursive temp as(
    SELECT employee_id from Employees where manager_id=1 and employee_id!=1
    union all
    select a.employee_id from Employees a join temp b on a.manager_id=b.employee_id
)
select * from temp
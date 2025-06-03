-- # Write your MySQL query statement below

-- --brute force solution

-- with temp as(
-- SELECT employee_id from Employees where manager_id=1 and employee_id!=1),
-- temp2 as(
-- select employee_id from Employees where manager_id in (select employee_id from temp))
-- select employee_id from temp
-- union all
-- select employee_id from temp2
-- union all
-- select employee_id from Employees where manager_id in (select employee_id from temp2)

-- --recursive solution
with recursive temp as(
    SELECT employee_id from Employees where manager_id=1 and employee_id!=1
    union all
    select a.employee_id from Employees a join temp b on a.manager_id=b.employee_id
)
select * from temp
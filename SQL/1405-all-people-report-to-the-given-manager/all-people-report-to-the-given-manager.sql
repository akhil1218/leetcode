# Write your MySQL query statement below
with temp as(
SELECT employee_id from Employees where manager_id=1 and employee_id!=1),
temp2 as(
select employee_id from Employees where manager_id in (select employee_id from temp))
select employee_id from temp
union all
select employee_id from temp2
union all
select employee_id from Employees where manager_id in (select employee_id from temp2)
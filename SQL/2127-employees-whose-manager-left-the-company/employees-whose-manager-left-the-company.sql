# Write your MySQL query statement below
select a.employee_id from(
select employee_id,manager_id from Employees where manager_id is not null and salary<30000) a left join Employees e on a.manager_id=e.employee_id where e.employee_id is null order by 1



# Write your MySQL query statement below
select unique_id,name from Employees e1 left join EmployeeUNI e2 on e1.id=e2.id group by e1.id
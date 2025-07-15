# Write your MySQL query statement below
select employee_id,department_id from Employee where primary_flag='N' and employee_id not in(select employee_id from Employee where primary_flag='Y')
union all
select employee_id,department_id from Employee where primary_flag='Y'
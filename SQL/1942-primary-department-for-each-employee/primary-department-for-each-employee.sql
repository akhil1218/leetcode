# Write your MySQL query statement below
select employee_id,department_id from(
select employee_id,department_id,row_number() over(partition by employee_id order by primary_flag) as rnk from Employee) a where rnk=1
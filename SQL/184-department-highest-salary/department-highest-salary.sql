# Write your MySQL query statement below
select Department,Employee,salary as Salary from(
select d.name as Department,e.name as Employee,salary,rank() over(partition by d.name order by salary desc) as rnk from Employee e join Department d on e.departmentId=d.id) a where rnk=1
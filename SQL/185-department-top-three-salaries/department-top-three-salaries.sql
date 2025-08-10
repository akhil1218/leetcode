# Write your MySQL query statement below
select Department,Employee,salary as Salary from(
select e.name as Employee,salary,d.name as Department,dense_rank() over(partition by e.departmentId order by salary desc) as rnk from Employee e join Department d on e.departmentId=d.id) a where rnk<=3
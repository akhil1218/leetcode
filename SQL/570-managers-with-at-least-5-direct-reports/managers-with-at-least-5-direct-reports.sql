# Write your MySQL query statement below
select m.name as name from Employee e join Employee m on e.managerId=m.id group by e.managerId,m.name having count(*)>=5
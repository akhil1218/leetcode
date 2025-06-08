# Write your MySQL query statement below
select *,case when x+y>z and z+x>y and y+z>x then 'Yes' else 'No' end triangle from Triangle
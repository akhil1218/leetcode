# Write your MySQL query statement below
Delete from person where id not in(select id from(select email,min(id) as id from Person group by email)b)
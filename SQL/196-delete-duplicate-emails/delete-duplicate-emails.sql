# Write your MySQL query statement below
Delete p from person p join (select email,min(id) as id from Person group by email)b on p.email=b.email and p.id!=b.id
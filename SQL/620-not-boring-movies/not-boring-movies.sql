# Write your MySQL query statement below
select id,movie,description,rating from Cinema where description not like '%boring%' and id%2=1 order by rating desc
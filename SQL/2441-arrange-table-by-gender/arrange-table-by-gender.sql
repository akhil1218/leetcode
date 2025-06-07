# Write your MySQL query statement below
select user_id,gender from(
select *, case when gender='female' then 0 when gender='other' then 1 else 2 end as status, row_number() over(partition by gender order by user_id) as rn from Genders)a order by rn,status
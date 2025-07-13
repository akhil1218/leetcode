# Write your MySQL query statement below

select name as results from(
(select name from(
select name,count(movie_id) as n_movies,row_number() over(order by count(movie_id) desc,name) as rnk from MovieRating m join Users u on m.user_id=u.user_id group by m.user_id,name)a where rnk=1)
union all
(select name from(
select title as name,avg(rating) as rate,row_number() over(order by avg(rating) desc,title) as rnk from MovieRating m join Movies u on m.movie_id=u.movie_id and date_format(created_at,'%Y-%m')='2020-02' group by m.movie_id,title)a where rnk=1))a
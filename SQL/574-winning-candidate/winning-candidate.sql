# Write your MySQL query statement below
select name from(
select name,row_number() over(order by count(*) desc) as rnk from Vote v join Candidate c on v.candidateId=c.id group by candidateId,name)a where rnk=1
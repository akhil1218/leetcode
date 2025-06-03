# Write your MySQL query statement below
with temp as(
select company,salary,id,row_number()over(partition by company order by salary,id) as rnk from Employee order by company,salary),
temp2 as(
    select company,count(id) as t_count from Employee group by company
)
select id,t1.company as company, salary from temp t1 join temp2 t2 on t1.company=t2.company where (
    t_count % 2 = 0 
    AND (t1.rnk = t_count / 2 OR t1.rnk = t_count / 2 + 1)
  ) 
   OR (
    t_count % 2 = 1 
    AND t1.rnk = FLOOR(t_count / 2) + 1
  )order by id,company,salary
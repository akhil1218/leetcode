# Write your MySQL query statement below
with temp as(
select lat,lon from Insurance group by lat,lon having count(*)>1),
temp2 as(
select t1.pid,t1.tiv_2015,t1.tiv_2016,t1.lat,t1.lon from Insurance t1 join Insurance t2 on t1.pid!=t2.pid and t1.tiv_2015=t2.tiv_2015 group by 1,2,3,4,5)
select round(sum(q1.tiv_2016),2) as tiv_2016 from temp2 q1 WHERE NOT EXISTS (
  SELECT 1 FROM temp t WHERE t.lat = q1.lat AND t.lon = q1.lon
)
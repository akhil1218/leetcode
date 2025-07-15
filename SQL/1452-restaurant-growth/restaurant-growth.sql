# Write your MySQL query statement below
with customer_final as(
    select visited_on,sum(amount) as total_amount from Customer group by 1
)
select visited_on,amount,round(amount/7,2) as average_amount from(
select visited_on,sum(total_amount) over(order by visited_on rows between 6 preceding and current row) as amount,count(*) over(order by visited_on rows between 6 preceding and current row) as days_count from customer_final)t where days_count=7 order by 1
# Write your MySQL query statement below
with transactions_flag as(
select transaction_date,amount,case when amount%2=0 then 'even' when amount%2=1 then 'odd' else 0 end as amount_flag from transactions)
select transaction_date,sum(case when amount_flag='odd' then amount else 0 end) as odd_sum,sum(case when amount_flag='even' then amount else 0 end) as even_sum from transactions_flag group by transaction_date order by 1
# Write your MySQL query statement below
WITH DailyRevenue AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT
    a.visited_on,
    SUM(b.amount) AS amount,
    ROUND(SUM(b.amount) / 7, 2) AS average_amount
FROM
    DailyRevenue a
JOIN
    DailyRevenue b
ON
    b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on
GROUP BY
    a.visited_on
HAVING
    COUNT(DISTINCT b.visited_on) = 7
ORDER BY
    a.visited_on;

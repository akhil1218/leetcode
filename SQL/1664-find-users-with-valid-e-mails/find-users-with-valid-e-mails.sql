-- # Write your MySQL query statement below
-- select user_id,name,mail from Users where mail regexp '^[A-Za-z][a-zA-Z0-9_./-]*(@leetcode\\.com)$'

# Write your MySQL query statement below
SELECT user_id, name, mail
FROM Users
WHERE REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$', 'c');

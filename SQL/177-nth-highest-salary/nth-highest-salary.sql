CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select max(salary) from 
      (select salary,dense_rank() over(order by salary desc) as rnk from Employee) a where rnk=N

  );
END
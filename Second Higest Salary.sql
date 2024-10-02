with cte
as
(
      select salary
		  ,id
		  ,DENSE_RANK() over (order by salary desc) as rk
	from Employee
)
select MAX(salary) AS SecondHighestSalary from cte where rk = 2

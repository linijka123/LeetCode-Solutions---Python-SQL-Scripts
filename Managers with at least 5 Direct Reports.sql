Select name
From Employee
where id in
(
Select managerId
From Employee
--Where id <> managerId
Group by managerId
Having COUNT(1) >= 5 
)
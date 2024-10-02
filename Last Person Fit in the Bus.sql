select person_name 
from 
(select 
       a.person_name
     , a.SumaPoprzedniego
     , a.person_id
	 , RANK () over (order by a.SumaPoprzedniego desc) as rk
from (select person_id,person_name
,SUM(weight) OVER(ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING ) AS SumaPoprzedniego
from Queue) as a
where a.SumaPoprzedniego between 0 and 1000
) as b
where b.rk = 1

select  a.product_id
       ,a.min as first_year 
	   ,b.quantity
	   ,b.price 
from 
(
  select  MIN(a.year) as min
		   ,b.product_id 
	from Sales as a 
	join Product as b
	on a.product_id = b.product_id
	group by b.product_id

)as a
join Sales as b
on a.min = b.year
and a.product_id = b.product_id
select ROUND(SUM(tiv_2016),2) as tiv_2016
from
(
	select  COUNT(1) over (partition by lat,lon) as lat_lon
		   ,COUNT(1) over (partition by tiv_2015) as tiv_2015
		   ,tiv_2016
	from Insurance
) as a
where a.lat_lon = 1 
and a.tiv_2015 > 1
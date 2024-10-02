select round(cast(count(*) as float) / (select count(distinct player_id) from Activity),2) as fraction 
from
(
	Select player_id,MIN(event_date) as mins
	From Activity as a
	Group by player_id
) as a
join Activity as b
on a.player_id = b.player_id
and DATEDIFF(DD,a.mins,b.event_date) = 1
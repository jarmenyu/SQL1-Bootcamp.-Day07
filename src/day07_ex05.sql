select distinct p.name as name
from person_order as po 
inner join person as p on p.id = po.person_id
order by name asc;
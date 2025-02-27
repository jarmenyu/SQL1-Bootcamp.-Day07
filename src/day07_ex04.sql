select p.name as name, count(pv.person_id) as count_of_visits
from person as p
inner join person_visits as pv on p.id = pv.person_id
group by p.name
HAVING COUNT(pv.person_id) > 3;
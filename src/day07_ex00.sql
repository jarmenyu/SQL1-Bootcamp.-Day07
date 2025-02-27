select pv.person_id as person_id, count(*) as count_of_visits
from person_visits as pv
group by person_id
order by count_of_visits desc, person_id asc;
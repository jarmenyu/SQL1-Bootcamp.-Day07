with top_visitors as (
    select pd.person_id, p.name as person_name, count(*) as count_of_visits,
           ROW_NUMBER() OVER (ORDER BY count(*) DESC, p.name ASC) AS rank
    from person_visits as pd
    inner join person as p on p.id = pd.person_id
    group by pd.person_id, p.name
)
select person_name as name, count_of_visits 
from top_visitors
where rank <= 4
order by name asc, count_of_visits desc;



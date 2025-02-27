with visits as (
    select pi.name as name, count(*) as count, pi.id as id
    from person_visits as pv
    inner join pizzeria as pi on pi.id = pv.pizzeria_id
    group by pi.name, pi.id
),
orders as (
    select pi.name as name, count(*) as count, pi.id as id
    from person_order as po
    inner join menu as m on m.id = po.menu_id
    inner join pizzeria as pi on pi.id = m.pizzeria_id
    group by pi.name, pi.id
)
select  coalesce(v.name, o.name) as name, 
        coalesce(v.count, 0) + coalesce(o.count, 0) as total_count
from visits as v
full outer join orders as o on v.id = o.id
order by total_count desc, name asc;



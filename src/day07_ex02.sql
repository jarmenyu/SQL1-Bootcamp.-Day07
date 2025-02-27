with top_visits as (
    select pi.name as name, count(*) as count, 'visit' as action_type
    from person_visits as pv
    inner join pizzeria as pi on pi.id = pv.pizzeria_id
    group by pi.name
    order by count desc
    limit 3
),
top_orders as (
    select pi.name as name, count(*) as count, 'order' as action_type
    from person_order as po
    inner join menu as m on m.id = po.menu_id
    inner join pizzeria as pi on pi.id = m.pizzeria_id
    group by pi.name
    order by count desc
    limit 3
)
select name, count, action_type
from top_visits
union
select name, count, action_type
from top_orders
order by action_type asc, count desc;




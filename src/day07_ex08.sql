select p.address as address,
       pi.name as name,
       count(*) as count_of_orders
from person as p 
inner join person_order as po on p.id = po.person_id
inner join menu as m on m.id = po.menu_id
inner join pizzeria as pi on pi.id = m.pizzeria_id
group by p.address, pi.name
order by address asc, name asc;
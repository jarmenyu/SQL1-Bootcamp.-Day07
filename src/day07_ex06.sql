select pi.name as name,
       count(po.id) as count_of_orders, 
       round(avg(m.price), 2) as average_price,
       max(m.price) as max_price,
       min(m.price) as min_price
from pizzeria as pi
inner join menu as m on m.pizzeria_id = pi.id
inner join person_order as po on po.menu_id = m.id
group by pi.id
order by name asc;

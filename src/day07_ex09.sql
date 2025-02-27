select p.address as address,
       round(max(p.age) - (min(p.age)::decimal / max(p.age)::decimal), 2) as formula,
       round(avg(p.age), 2) as average,
       case
           when((round(max(p.age) - (min(p.age) / max(p.age)), 2)) > round(avg(p.age), 2)) then 'true'
           else 'false'
       end as comparison
from person as p 
group by p.address
order by address asc;
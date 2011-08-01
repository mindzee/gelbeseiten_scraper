select
c.name AS Category, c2.name AS City, o.name AS Title, 
address AS Address, area AS Area, phone AS Phone, email AS Email, website AS Website
from data_objects as o
left join data_categories as c on c.category_id = o.category_id
left join data_cities as c2 on c2.city_id = o.city_id
order by c.name, c2.name, o.name
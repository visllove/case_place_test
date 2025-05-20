select
    p.name_store as "Название магазина",
    o.nomenclature as "Номенклатура",
    o.date as "Дата заказа",
    (o.price * o.quantity_product) as "Выручка"
from orders_directory o
join product_directory p using(nomenclature)
where p.name_store = 'Магазин 1'
order by o.date asc;
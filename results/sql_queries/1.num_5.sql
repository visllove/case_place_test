select pd.barcode as "Штрихкод товара",
od.date as "Дата",
sum(od.quantity_product) as "Количество заказов",
sum(od.price * od.quantity_product) as "Выручка",
sum(od.price * od.quantity_product * 0.95) as "Прибыль с учетом налога"
from orders_directory od join product_directory pd using(nomenclature)
where pd.barcode = 'Code_1'
group by od.date, pd.barcode
order by od.date desc
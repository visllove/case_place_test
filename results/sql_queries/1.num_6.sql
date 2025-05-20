select pd.print as "Артикул принта", pd.name_print_1 as "Название принта №1", sum(od.quantity_product) as "Количество продаж"
from print_directory pd join product_directory pd2 using(print)  join orders_directory od using(nomenclature)
group by pd.print, pd.name_print_1
order by sum(od.quantity_product) desc
limit 1
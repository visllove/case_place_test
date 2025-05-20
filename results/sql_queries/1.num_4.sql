select name_store as "Название магазина",
nomenclature as "Номенклатура",
warehouse as "Название склада",
value_stocks as "Количество остатков"
from product_directory pd join stocks_directory sd using(nomenclature)
where warehouse = 'Склад 1' and date = date('2024-10-18') and value_stocks > 0
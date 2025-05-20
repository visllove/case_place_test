select nomenclature as "Номенклатура", print as "Артикул принта", name_print_1 as "Название принта"
from product_directory pd join print_directory pd2 using(print)
where name_print_1 is not null and name_print_2 is not null;
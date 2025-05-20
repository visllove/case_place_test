--Задача 1
create database shop_db;

--Создание таблиц
CREATE TABLE print_directory (
    print VARCHAR(20) PRIMARY KEY,
    name_print_1 VARCHAR(100),
    name_print_2 VARCHAR(100)
);

CREATE TABLE product_directory (
    name_store VARCHAR(100),
    nomenclature VARCHAR(20) PRIMARY KEY,
    print VARCHAR(20) REFERENCES print_directory(print),
    barcode VARCHAR(20)
);

CREATE TABLE stocks_directory (
    date DATE,
    nomenclature VARCHAR(20) REFERENCES product_directory(nomenclature),
    warehouse VARCHAR(100),
    value_stocks INT
);

CREATE TABLE orders_directory (
    date DATE,
    nomenclature VARCHAR(20) REFERENCES product_directory(nomenclature),
    orders_type VARCHAR(50),
    price INT,
    quantity_product INT
);

--Заполнение таблиц
INSERT INTO print_directory (print, name_print_1, name_print_2) VALUES
('art_1', 'Цветочек', 'Цветочек в поле'),
('art_2', 'Белое облачко', NULL),
('art_3', 'Машина', 'Спорткар'),
('art_4', 'Тигр', 'Тигр в цветочках');

INSERT INTO product_directory (name_store, nomenclature, print, barcode) VALUES
('Магазин 1', 'mag_11', 'art_1', 'Code_1'),
('Магазин 2', 'mag_21', 'art_1', 'Code_2'),
('Магазин 1', 'mag_12', 'art_2', 'Code_1'),
('Магазин 3', 'mag_31', 'art_2', 'Code_2'),
('Магазин 2', 'mag_22', 'art_1', 'Code_1');

INSERT INTO stocks_directory (date, nomenclature, warehouse, value_stocks) VALUES
('2024-10-18', 'mag_11', 'Склад 1', 10),
('2024-10-18', 'mag_12', 'Склад 1', 5),
('2024-10-18', 'mag_21', 'Склад 2', 7),
('2024-10-17', 'mag_31', 'Склад 2', 20),
('2024-10-17', 'mag_12', 'Склад 1', 12),
('2024-10-17', 'mag_22', 'Склад 2', 7);

INSERT INTO orders_directory (date, nomenclature, orders_type, price, quantity_product) VALUES
('2024-10-17', 'mag_11', 'Тип 1', 150, 2),
('2024-10-17', 'mag_22', 'Тип 1', 120, 7),
('2024-10-16', 'mag_31', 'Тип 2', 300, 1),
('2024-10-15', 'mag_21', 'Тип 1', 175, 2),
('2024-10-15', 'mag_11', 'Тип 2', 150, 1);

--task 1
select
    p.name_store as "Название магазина",
    o.nomenclature as "Номенклатура",
    o.date as "Дата заказа",
    (o.price * o.quantity_product) as "Выручка"
from orders_directory o
join product_directory p using(nomenclature)
where p.name_store = 'Магазин 1'
order by o.date asc;


--task 2
select *
from print_directory
where print not in (
	select print from product_directory where print is not null
)


--task 3
select nomenclature as "Номенклатура", print as "Артикул принта", name_print_1 as "Название принта"
from product_directory pd join print_directory pd2 using(print)
where name_print_1 is not null and name_print_2 is not null;

--task 4
select name_store as "Название магазина",
nomenclature as "Номенклатура",
warehouse as "Название склада",
value_stocks as "Количество остатков"
from product_directory pd join stocks_directory sd using(nomenclature)
where warehouse = 'Склад 1' and date = date('2024-10-18') and value_stocks > 0

--task 5
select pd.barcode as "Штрихкод товара",
od.date as "Дата",
sum(od.quantity_product) as "Количество заказов",
sum(od.price * od.quantity_product) as "Выручка",
sum(od.price * od.quantity_product * 0.95) as "Прибыль с учетом налога"
from orders_directory od join product_directory pd using(nomenclature)
where pd.barcode = 'Code_1'
group by od.date, pd.barcode
order by od.date desc

--task 6
select pd.print as "Артикул принта", pd.name_print_1 as "Название принта №1", sum(od.quantity_product) as "Количество продаж"
from print_directory pd join product_directory pd2 using(print)  join orders_directory od using(nomenclature)
group by pd.print, pd.name_print_1
order by sum(od.quantity_product) desc
limit 1


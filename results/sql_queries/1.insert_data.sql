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
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
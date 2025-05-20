-- Создаем базу данных company_db
CREATE DATABASE company_db;

-- Создание схемы business
CREATE SCHEMA business;

-- Создаем пользователя admin_user и выдаем ему полные права к business
CREATE USER admin_user WITH PASSWORD 'admin_pass';

-- Полный доступ к схеме и любым будушим объектам в схеме business
GRANT ALL PRIVILEGES ON SCHEMA business TO admin_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA business GRANT ALL ON TABLES TO admin_user;

-- Создаем пользователя read_user с правами только на чтение схемы business
CREATE USER read_user WITH PASSWORD 'user_pass';

-- Даем права на чтение объектов схемы business
GRANT USAGE ON SCHEMA business TO read_user;
GRANT SELECT ON ALL TABLES IN SCHEMA business TO read_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA business GRANT SELECT ON TABLES TO read_user;

-- Проверка admin_user (создаем и удаляем таблицу)
SET ROLE admin_user;
CREATE TABLE business.test_table(id INT);
CREATE TABLE business.test_user_table(id INT);
DROP TABLE business.test_table;
RESET ROLE;

-- Проверка read_user
SET ROLE read_user;
SELECT * FROM business.test_user_table;

-- Пробуем создать таблицу (ошибка, т.к. нет прав)
CREATE TABLE business.test_reader(id INT);
RESET ROLE;
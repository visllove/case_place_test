-- журнал изменений таблицы product_directory
create table product_changes_logs (
    change_id serial primary key,
    change_time timestamp default now(),
    user_name text,
    nomenclature text,
    column_name text,
    old_value text,
    new_value text
);

-- функция триггера на логирование изменений
create or replace function log_product_updates()
returns trigger as $$
begin
    if old.name_store is distinct from new.name_store then
        insert into product_changes_logs(user_name, nomenclature, column_name, old_value, new_value)
        values (current_user, old.nomenclature, 'name_store', old.name_store, new.name_store);
    end if;

    if old.print is distinct from new.print then
        insert into product_changes_logs(user_name, nomenclature, column_name, old_value, new_value)
        values (current_user, old.nomenclature, 'print', old.print, new.print);
    end if;

    if old.barcode is distinct from new.barcode then
        insert into product_changes_logs(user_name, nomenclature, column_name, old_value, new_value)
        values (current_user, old.nomenclature, 'barcode', old.barcode, new.barcode);
    end if;

    return new;
end;
$$ language plpgsql;

-- создание триггера логирования update-операций
create trigger product_directory_update_trigger
after update on product_directory
for each row execute procedure log_product_updates();
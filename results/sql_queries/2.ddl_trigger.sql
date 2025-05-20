-- Создаем журнал для DDL events
create table ddl_logs (
    log_id serial primary key,
    event_time timestamp default now(),
    user_name text,
    event_type text,
    object_type text,
    object_name text,
    command text
);

-- Функция для обработки триггера
create or replace function log_ddl_actions()
returns event_trigger as $$
declare 
    rec record;
begin
    -- обходим все ddl команды при срабатывании триггера
    for rec in select * from pg_event_trigger_ddl_commands()
    loop
        -- вставляем запись о ddl в таблицу
        insert into ddl_logs(user_name, event_type, object_type, object_name, command)
        values (
            current_user,
            tg_tag,
            rec.object_type,
            rec.object_identity,
            current_query()
        );
    end loop;
end;
$$ language plpgsql;

-- Триггер на любой DDL event
create event trigger ddl_trigger_log
on ddl_command_end
execute procedure log_ddl_actions();
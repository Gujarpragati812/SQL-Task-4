create or replace function policy_expire()
returns trigger as $$
begin
if new.end_date < CURRENT_DATE then
raise exception 'policy expired';
end if;
return new;
end; 
$$ language plpgsql;

create trigger policy_expire
after update on policies 
for each row
execute function policy_expire()


update policies  set end_date='2024-11-11' where agent_id=17

update policies  set end_date='2024-09-11' where agent_id=17
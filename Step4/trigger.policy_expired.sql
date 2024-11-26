create or replace function policy_expired()
returns trigger as $$
begin
if new.end_date < CURRENT_DATE then
RAISE NOTICE 'The policy with end date % has expired', new.end_date;
raise exception 'policy expired';
end if;
return new;
end;
$$ language plpgsql
create trigger policy_expir
before insert or update on policies
for each row
execute function policy_expired()

update policies set end_date = '2024-10-23' where policy_id = 1
select * from policies
select * from policies where policy_id=1
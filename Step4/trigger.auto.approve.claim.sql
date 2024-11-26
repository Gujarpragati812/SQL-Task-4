create or replace function auto_approve_claim()
returns trigger as $$
begin
if new.amount_claimed<10000 then
set status='approved';
else
raise exception 'claim approved';
end if;
return new;
end;
$$ language plpgsql

create trigger auto_approve_cl
after insert or update on claims
for each row
execute function auto_approve_claim()

insert into claims values (
2002,'2024-12-10',34000,null,132,'nikita')


update claims set amount_claimed = 340000 where policy_id=132

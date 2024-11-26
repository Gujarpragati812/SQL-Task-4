create or replace function claim_approve()
returns trigger as $$
begin
if  new.amount_claimed <10000 then 
new.status = 'claim approved';
end if;
return new;
end;
$$  language plpgsql

create trigger claim_approv
before insert or update on claims 
for each row
execute function claim_approve()

insert into claims (claim_date,amount_claimed,policy_id,approved_by) values 
('2024-10-23',9000,300,'pragati')

update claims set amount_claimed = 15000 where approved_by = 'Zaina Mand'


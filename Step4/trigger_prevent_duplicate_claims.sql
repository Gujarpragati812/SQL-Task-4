create or replace function prevent_duplicate_claim()
returns trigger as $$
begin
if exists (select * from claims where claim_date = new.claim_date
and amount_claimed=new.amount_claimed 
and status=new.status
and policy_id=new.policy_id 
and approved_by=new.approved_by) then
raise notice 'This % id already exist',new.policy_id;
raise exception 'alreay applied for the claim';
end if;
return new;
end;
$$ language plpgsql;


create trigger prevent_duplicateclai
before insert or update on claims
for each row
execute function prevent_duplicate_claim() 

insert into claims values (
2002,'2024-12-07',25000,'Rejected',38,'Pragati'
)
update claims set claim_date = '2024-10-24' where claim_id=1


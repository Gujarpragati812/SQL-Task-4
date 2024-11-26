create or replace function prevent_duplicate_claims()
returns trigger as $$
begin
if exists (select * from claims where amount_claimed =new.amount_claimed and status=new.status and 
policy_id=new.policy_id and approved_by=new.approved_by )
then raise exception 'customer already applied for claim';
elsif new.claim_date = old.claim_date then raise exception 'customer already applied for claim';
end if;
return new;
end;
$$ language plpgsql

create trigger prevent_duplicate_claims
before insert or update on claims
for each row
execute function prevent_duplicate_claims()

insert into claims values ('2020-12-06',164715,'Pending',537,'Zaina mand')
insert into claims values ('2020-12-06',164715,'Pending',537,'Zaina Mand')


create or replace function claim_status()
returns trigger as $$
begin
if 
new.amount_claimed < 10000 then
new.status = 'approved claim';
else
new.status = 'under review';
end if;
return new;
end;
$$ language plpgsql;
create trigger claim_stat
after insert or update on claims
for each row 
execute function claim_status() 

insert into claims (claim_id,
claim_date,amount_claimed,policy_id,approved_by
) values (1522,
'2024-10-10',1500,34,'mayank'
)

select * from claims where claim_id = 1522
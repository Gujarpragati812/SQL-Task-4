CREATE OR REPLACE FUNCTION calculate_agent_commission()
RETURNS TRIGGER AS $$
BEGIN
UPDATE agents
SET commission_rate = (
SELECT NEW.premium_amount * 0.1
FROM agents       
WHERE a.agent_id = NEW.agent_id)
WHERE agent_id = NEW.agent_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

cREATE TRIGGER agent_commission_trigg
AFTER INSERT ON policies
FOR EACH ROW
EXECUTE FUNCTION calculate_agent_commission();

update policies set premium_amount=230000 where policy_id=51

insert into policies values (1002,'Auto',230000,4500,'2020-10-24','2024-10-24',100,37,'nishant')



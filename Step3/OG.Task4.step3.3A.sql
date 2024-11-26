select a.agent_id,a.agent_name,count(p.policy_id) as policies_sold
from agents a join policies p on
p.agent_id=a.agent_id group by a.agent_id,a.agent_name 
order by agent_id asc
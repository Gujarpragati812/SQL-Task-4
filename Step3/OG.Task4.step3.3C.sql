select c.customer_id,c.customer_name,pa.payment_id,p.policy_id,
pa.payment_date,pa.amount,pa.payment_method from payments pa join 
policies p on p.policy_id= pa.policy_id
join customer c on p.customer_id=c.customer_id 
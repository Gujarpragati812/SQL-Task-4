create table customer(customer_id serial primary key,
customer_name varchar,
date_of_birth date,
gender varchar,	
contact_number bigint,	
email varchar,	
address varchar,	
aadhaar_number int unique,
pan_number int unique)
alter table customer alter column aadhaar_number type bigint
alter table customer alter column contact_number type varchar using contact_number::varchar

copy customer from 'E:/insurance_data.xlsx - Customers.csv' DELIMITER ',' csv header
create table agents (
agent_id serial primary key,
Agent_name varchar,
contact_number bigint, 
email varchar,
commission_rate int)
ALTER TABLE agents ALTER COLUMN commission_rate TYPE DOUBLE PRECISION USING commission_rate::DOUBLE PRECISION
alter table agents alter column contact_number type varchar using contact_number::varchar
copy agents from 'E:/insurance_data.xlsx - Agents.csv' DELIMITER ',' csv header

create table claims(
claim_id serial primary key,
claim_date date,
amount_claimed int,
status varchar,
policy_id int,
approved_by varchar)
copy claims from 'E:/insurance_data.xlsx - Claims.csv' DELIMITER ',' csv header

create table payments (
payment_id serial primary key,
payment_date date,
amount int,
payment_method varchar,
payment_uuid varchar,
policy_id int)
copy payments from 'E:/insurance_data.xlsx - Payments.csv' DELIMITER ',' csv header
create table policies (
policy_id serial primary key,
policy_type varchar,
coverage_amount int,
premium_amount int,
start_date date,
end_date date, 
customer_id int references customer(customer_id),
agent_id int references agents(agent_id),
approved_by varchar)
copy policies from 'E:/insurance_data.xlsx - Policies.csv' DELIMITER ',' csv header


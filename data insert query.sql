create table customers (customer_name varchar,date_of_birth date,
gender varchar,contact_number bigint,
email varchar,address varchar,
aadhaar_number varchar,pan_number varchar)

create table payments(payment_date date,amount	int, payment_method varchar,payment_uuid varchar,policy_id int)

create table claims(claim_date date,amount_claimed int,status varchar,	policy_id int,approved_by varchar)

create table agents(Agent_name varchar,contact_number bigint,email varchar,commission_rate int)

create table policies (policy_type varchar,
coverage_amount int,premium_amount int,
start_date date,
end_date date, customer_id int,agent_id serial primary key,
approved_by varchar
)

create table employees (employee_id serial primary key,
first_name varchar(50) ,
last_name varchar(50) ,
salary decimal(10, 2) );

create or replace procedure add_employee(
new_first_name varchar,new_last_name varchar,
 new_salary decimal)
language plpgsql
as $$
begin
insert into 
employees (first_name,last_name,salary)
values (new_first_name,new_last_name,new_salary);
raise notice 'inserted data: % %, salary: %',new_first_name,
new_last_name,new_salary;
end; $$;

call add_employee('rohit','sharma',12.000);
select * from employees


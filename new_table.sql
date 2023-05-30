--create table
create table account (user_id serial primary key ,
					 username varchar(50) unique not null,
					 password varchar(50) not null,
					 email varchar(250) unique not null,
					 created_on timestamp not null,
					 last_login timestamp
					 )
create table job(
job_id serial primary key,
job_name varchar(250) unique not null)


create table job_account (
user_id integer references account(user_id),
job_id integer references job(job_id),
hire_date timestamp)


--insert

select * from account
insert into account (username, password , email, created_on)
values
('nadiralbab','abcs','naba@gmail.com', current_timestamp)



select * from job

insert into job(job_name)
values 
('data scientist')

INSERT INTO JOB(JOB_NAME)
VALUES
('DATA ANALYST')

INSERT INTO job_account(user_id,job_id,hire_date)
values 
(1,1,current_timestamp)

select * from job_account

INSERT INTO job_account(user_id,job_id,hire_date)
values 
(1,3,current_timestamp)



--update table

select * from account 
update account
set last_login = created_on 

select * from job_account
update job_account

set hire_date = account.created_on from account 
where job_account.user_id = account.user_id

select * from account

update account 
set last_login = current_timestamp
returning email, created_on, last_login



--alter table
create table information(
info_id serial primary key ,
title varchar (500) not null,
person varchar (50) not null unique
)
select * from information

alter table information 
rename to new_info	

select * from new_info

alter table new_info 
RENAME COLUMN person to people 

select * from new_info

insert into new_info(title)
values 
('ek tha tiger')

alter table new_info
alter column people drop not null

select * from new_info

--drop table

select * from new_info

alter table new_info 
drop column if exists people


--check constraints--
create table employees (
emp_id serial primary key, 
first_name varchar(50) not null,
last_name varchar(50) not  null,
birthdate date check(birthdate >'2000-01-01'),
hire_date date check (hire_date > birthdate),
salary integer check (salary >0) 
)
insert into employees( first_name  , last_name , birthdate , hire_date , salary)
values
('dhanyawad', 'kumar', '2003-02-01', '2010-03-02', 20000)




--case
select customer_id,
case customer_id 
	when 2 then 'winner'
	when 5 then 'looser'
	else 'normal'
end as result_new
from customer


select 
sum(case rental_rate
   when 0.99 then 1 else 0
   end ) as bargains,

sum(case rental_rate
   when 2.99 then 1 else 0
   end ) as regular,


sum(case rental_rate
   when 4.99 then 1 else 0
   end ) as premium
  from film
  
  
--cast--
select '5' :: integer

select cast(inventory_id as varchar) from rental 
select char_length(cast(inventory_id as varchar)) from rental 


--views
select * from customer
select * from address 



select first_name , last_name,address from customer 
inner join address
on customer.address_id = address.address_id


create view customer_id as 
select first_name , last_name,address from customer 
inner join address
on customer.address_id = address.address_id



select * from customer_id

create or replace view customer_info as 
select first_name , last_name , district from customer 
inner join address
on customer.address_id = address.address_id



select * from customer_info




























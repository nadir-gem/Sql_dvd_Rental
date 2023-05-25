-- To select whole table we use select * and to sort any coloumn we should you orderby statement
--we can sort the coloumn in both the order asc or desc . The default order by is ascs 
select * from customer order by first_name desc

select * from customer order by first_name

select * from customer

select * from film where rental_rate > 4 and replacement_cost >= 18
and rating = 'R' and rating = 'NC-17'

--Sometimes a table contains a column that has duplicate values
--and in order to return only the unique values, DISTINCT statement
--is used in combination with SELECT
select count( distinct film_id) from film

select film_id,rental_rate,replacement_cost,rating,title from film 
where rental_rate > 4 or replacement_cost >= 18 and rating = 'R' and rating = 'NC-17' 

select count(*) from film

--WHERE statement allows us to specify the conditions on columns for the rows to be returned
	
select * from customer where first_name = 'Jared'

select * from payment 
where amount between 8 and 9

--WHERE statement allows us to specify the
--conditions on columns for the rows to be returned
select * from payment 
where amount in(0.99,1.99)


Select * from customer 
where first_name in ('John', 'Jake','Julie')


--In order to match a string against a general pattern we use LIKE
--and ILIKE for example:
--All emails ending with ‘abc’
select * from customer where first_name Like 'J%' and last_name like '%s'

select count(*) from customer where first_name Like 'J%' and last_name like '%s'


select * from customer where first_name Like '%er%'
select * from customer where first_name Like '_er%' 


select * from customer where first_name not Like '_er%' and  last_name  like '_%r' 



--Aggregate Functions

-The main idea behind aggregate function is to take multiple inputs
and return a single output
● AVG() - Returns floating point values. ROUND() can be used to
specify precision after the decimal
● COUNT()
● MAX()
● MIN()
● SUM()


select * from film
select min(replacement_cost) from film
select max(replacement_cost) from film

select max(replacement_cost), min(replacement_cost) from film

select avg(replacement_cost) from film


select round(avg(replacement_cost),4) from film


select sum(replacement_cost) from film

select customer_id, amount from payment


--GROUP BY allows us to aggregate data and apply functions to
--better understand how data is distributed per category


select customer_id, sum(amount) as total_spent from payment
group by customer_id
having sum(amount) > 100

order by total_spent asc

/*order by customer_id asc*/

/*order by count(amount) */

select customer_id, count(amount) from payment
group by customer_id 
order by count(amount) desc


select date(payment_date), sum(amount) from payment
group by date(payment_date)
order by sum(amount) desc


select store_id , count(customer_id) from customer
group by store_id
having count(customer_id) > 100


select * from customer
select *
from payment
/*count(payment_id)
 count(distinct customer_id)*/
inner join customer 
on payment.customer_id = customer.customer_id


select payment_id, payment.customer_id , first_name from customer
inner join  payment
on payment.customer_id = customer.customer_id

select * from payment

select * from customer
select payment_id, payment.customer_id , first_name from payment

full outer join customer
on customer.customer_id = payment.customer_id
where customer.customer_id is null or payment.payment_id is null



select * from film 
select * from inventory


select film.film_id, title, inventory_id , store_id from film
left join inventory
on inventory.film_id = film.film_id

where inventory.film_id is null



select * from film
left join inventory 
on inventory.film_id = film.film_id

select * from inventory
left join film
on inventory.film_id = film.film_id


select payment_date from payment
select extract(year from payment_date )as year from payment
select extract(month from payment_date) as month from payment

select age(payment_date) from payment

select to_char(payment_date, 'month yyyy')from payment


--math function--

select * from film

select round(rental_rate/replacement_cost,2 )*100 as percent_cost from film

--string function-- 
select * from customer 

select first_name , length(first_name) as nadir from customer 
select first_name ||' '|| last_name as nadir_albab from customer


select upper(first_name) ||' '|| upper( last_name) as nadir_albab from customer


select left(first_name,2 )|| lower(left(last_name,2)) || '@gmail.com' as gmail from customer

--sub_query--
select * from film
select avg(rental_rate) as nadir from film



select title , rental_rate from film
where rental_rate > (	select avg(rental_rate)from film)




select * from rental 
select * from inventory 


select * from rental where return_date between '2005-05-29' and '2005-05-30'


select inventory.film_id 
from rental	
inner join inventory on inventory.inventory_id =  rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30'






select film_id, title 
from film
where film_id in 
(select inventory.film_id 
from rental	
inner join inventory on inventory.inventory_id =  rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30')
order by film_id


select first_name , last_name from customer	
where exists
(select * from payment 
where payment.customer_id = customer.customer_id
and amount >11)


--self joins--

select * from film


select f1.title , f2.title , f1.length 
from film as f1 
inner join film as f2 on
f1.film_id = f2.film_id
and f1.length = f2.length




select f1.title , f2.title , f1.length 
from film as f1 
inner join film as f2 on
f1.film_id != f2.film_id
and f1.length = f2.length


SELECT * FROM information_schema.tables;



SELECT table_name FROM information_schema.tables
                      WHERE table_schema='public'
					  AND table_type='BASE TABLE';

SELECT * FROM information_schema.tables WHERE table_schema = 'schema_name';













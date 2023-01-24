use sakila;

ALTER TABLE staff DROP COLUMN picture;

INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update)
values ("TAMMY","SANDERS",79,"TAMMY.SANDERS@sakilacustomer.org", 2, 1,"T", "TS","2006-02-15" );


/*
SELECT * FROM customer
WHERE first_name = 'TAMMY' and last_name ='SANDERS';
*/

/*
customer_id = 75
store_id = 2
first_name = "TAMMY"
last_name = "SANDERS"
email = "TAMMY.SANDERS@sakilacustomer.org"
address_id = 79
active = 1
create_date = "2006-02-14"
last_update = "2006-02-15"
*/


select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select film_id from sakila.film
where title = "Academy Dinosaur";

select inventory_id from sakila.inventory
where film_id = 1;

select staff_id from staff
where first_name = 'Mike' and last_name = 'Hillyer';






INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
SELECT CURDATE(), inventory.inventory_id, customer.customer_id, staff.staff_id
FROM customer 
JOIN inventory ON inventory.film_id = (SELECT film_id FROM film WHERE title = "Academy Dinosaur")
JOIN staff ON staff.staff_id = (SELECT staff_id FROM staff WHERE first_name = 'Mike' and last_name = 'Hillyer')
WHERE customer.first_name = 'CHARLOTTE' and customer.last_name = 'HUNTER';


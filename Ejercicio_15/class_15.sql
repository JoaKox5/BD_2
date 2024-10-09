USE sakila;



CREATE VIEW list_of_customers AS 
	SELECT cus.customer_id AS 'Customeer ID', CONCAT(cus.first_name, ' ', cus.last_name) AS 'Customer Name',
    a.address AS 'Address', a.postal_code AS 'Zip code', a.phone AS 'Phone', ci.city AS 'City', co.country AS 'Country',
    CASE WHEN cus.active = 1 THEN 'active' ELSE 'inactive' END AS 'Status', cus.store_id AS 'Store ID' 
    FROM customer cus INNER JOIN address a USING (address_id) INNER JOIN city ci USING (city_id) INNER JOIN country co USING (country_id);
    
SELECT * FROM list_of_customers;


CREATE VIEW film_details AS
	SELECT f.film_id AS 'Film ID', f.title AS 'Title', f.description AS 'Description', cat.name AS 'Category', f.rental_rate AS 'Price',
    f.length AS 'Length', f.rating AS 'Rating', GROUP_CONCAT(' ', a.first_name, ' ', a.last_name) AS 'Actors'
    FROM film f INNER JOIN film_category fc USING (film_id) INNER JOIN category cat USING (category_id) 
    INNER JOIN film_actor fa USING (film_id) INNER JOIN actor a USING (actor_id) GROUP BY f.film_id, cat.name;

SELECT * FROM film_details;
DROP VIEW film_details;



CREATE VIEW sales_by_film_category_the_sequel AS
	SELECT c.name AS 'Category', COUNT(r.rental_id) AS 'Total_rental' 
    FROM category c INNER JOIN film_category USING (category_id) INNER JOIN film f USING (film_id) 
    INNER JOIN inventory i USING (film_id) INNER JOIN rental r USING (inventory_id) GROUP BY c.category_id;
    
SELECT * FROM sales_by_film_category_the_sequel;



CREATE VIEW actor_information AS
	SELECT a.actor_id AS 'Actor ID', a.first_name AS 'Name', a.last_name AS 'Surname', COUNT(fa.film_id) AS 'Films acted'
    FROM actor a INNER JOIN film_actor fa USING (actor_id) GROUP BY a.actor_id;
    
SELECT * FROM actor_information;


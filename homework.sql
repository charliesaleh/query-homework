-- Week 5 - Wednesday Questions  
-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer
WHERE address_id IN (
    SELECT customer.address_id
    FROM customer
    INNER JOIN address
    ON customer.address_id = address.address_id
    WHERE district = 'Texas'
);

--Answer: There are 5 customers

-- 2. Get all payments above $6.99 with the Customer's Full Name  
SELECT customer.first_name, customer.last_name, payment.amount 
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;

--Answer: 3661 payments

-- 3. Show all customers names who have made payments over $175(Use subqueries) 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(amount) > 175
);

--Answer: 135 customers

-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Answer: Kevin Schuler

-- 5. Which staff member had the most transactions?  
SELECT first_name, last_name
FROM staff
WHERE staff_id IN(
    SELECT staff.staff_id
    FROM staff
    INNER JOIN payment
    ON staff.staff_id = payment.staff_id
    ORDER BY amount
    LIMIT 1
);

--Answer: Jon Stephans

-- 6. How many movies of each rating are there?  
SELECT rating, COUNT(*)
FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC;

--Answer: 5 movie ratings

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries) 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer.customer_id
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
    WHERE payment.amount > 6.99
);

--Answer: 597 customers

-- 8. How many free rentals did our stores give away? 
SELECT rental_id
FROM rental
WHERE rental_id IN (
    SELECT rental.rental_id
    FROM rental
    INNER JOIN payment
    ON rental.rental_id = payment.rental_id
);

--Answer: 14592?
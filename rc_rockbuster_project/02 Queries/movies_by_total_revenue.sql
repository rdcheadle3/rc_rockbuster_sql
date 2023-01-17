/* title, total revenue for all movies
in Rockbuster inventory sorted by highest
total revenue */
SELECT D.title,
       D.rating,
	   F.name AS genre,
	   SUM(A.amount) AS total_revenue
FROM payment A
INNER JOIN rental B ON A.rental_id = B.rental_id
INNER JOIN inventory C ON B.inventory_id = C.inventory_id
INNER JOIN film D ON C.film_id = D.film_id
INNER JOIN film_category E ON D.film_id = E.film_id
INNER JOIN category F ON E.category_id = F.category_id
GROUP BY title,
         rating,
		 genre
ORDER BY total_revenue DESC;
	   
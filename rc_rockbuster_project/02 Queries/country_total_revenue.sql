/* table containing list of all countries
where Rockbuster does business and total
revenue in those countries */
SELECT E.country,
       SUM(amount) AS total_revenue
FROM payment A
INNER JOIN customer B ON A.customer_id = B.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON d.country_id = E.country_id
GROUP BY country
ORDER BY total_revenue DESC;
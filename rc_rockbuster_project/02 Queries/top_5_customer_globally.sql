/* top 5 customers globally by total amount paid */
SELECT a.customer_id,
    a.first_name,
    a.last_name,
    e.country,
    d.city,
    sum(b.amount) AS total_amount_paid
FROM customer a
JOIN payment b ON a.customer_id = b.customer_id
JOIN address c ON a.address_id = c.address_id
JOIN city d ON c.city_id = d.city_id
JOIN country e ON d.country_id = e.country_id

GROUP BY a.customer_id, e.country, d.city
ORDER BY (sum(b.amount)) DESC
LIMIT 5;
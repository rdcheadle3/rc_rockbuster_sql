/* lists all countries with rockbuster customer
and is sorted from highest to lowest customer count */
SELECT d.country,
    count(a.customer_id) AS total_customers
   FROM customer a
     JOIN address b ON a.address_id = b.address_id
     JOIN city c ON b.city_id = c.city_id
     JOIN country d ON c.country_id = d.country_id
  GROUP BY d.country
  ORDER BY (count(a.customer_id)) DESC;
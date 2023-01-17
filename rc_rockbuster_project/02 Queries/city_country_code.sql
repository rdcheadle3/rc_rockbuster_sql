/* top 10 citites within
top 10 countries by total customers */
SELECT d.country,
    c.city,
    count(a.customer_id) AS total_customers
   FROM customer a
     JOIN address b ON a.address_id = b.address_id
     JOIN city c ON b.city_id = c.city_id
     JOIN country d ON c.country_id = d.country_id
  WHERE d.country IN (SELECT d.country
   FROM customer a
     JOIN address b ON a.address_id = b.address_id
     JOIN city c ON b.city_id = c.city_id
     JOIN country d ON c.country_id = d.country_id
     GROUP BY d.country
	 ORDER BY (count(a.customer_id)) DESC
	 LIMIT 10)
  GROUP BY d.country, c.city
  ORDER BY (count(a.customer_id)) DESC
 LIMIT 10;
/* store location by country and city */
SELECT A.store_id,
	   C.city,
       D.country
FROM store A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY store_id,
		 city,
		 country;
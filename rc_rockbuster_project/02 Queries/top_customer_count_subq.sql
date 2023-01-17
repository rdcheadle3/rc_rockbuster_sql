SELECT DISTINCT A.country,
				COUNT(DISTINCT D.customer_id) AS all_customer_count,
				COUNT(DISTINCT A.country) AS top_customer_count
FROM country A
INNER JOIN city B ON A.country_id = B.country_id
INNER JOIN address C ON B.city_id = C.city_id
INNER JOIN customer D ON C.address_id = D.address_id
LEFT JOIN 
(SELECT a.customer_id,
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
  WHERE d.city::text = ANY (ARRAY['Aurora'::character varying, 'Acua'::character varying, 
								  'Citrus Heights'::character varying, 'Iwaki'::character varying, 
								  'Ambattur'::character varying, 'Shanwei'::character varying, 
								  'So Leopoldo'::character varying, 'Teboksary'::character varying, 
								  'Tianjin'::character varying, 'Cianjur'::character varying]::text[])
  GROUP BY a.customer_id, e.country, d.city
  ORDER BY (sum(b.amount)) DESC
 LIMIT 5) AS top_five_customers ON A.country = top_five_customers.country
 GROUP BY A.country,
          top_five_customers
ORDER BY all_customer_count DESC
LIMIT 5;
 		  
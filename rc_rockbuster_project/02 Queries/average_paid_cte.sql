WITH average_total_paid_cte (customer_id, first_name,
							last_name, city, country,
							total_amount_paid) AS
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
  							WHERE d.city::text = ANY (ARRAY['Aurora'::character varying, 
								  'Acua'::character varying, 
								  'Citrus Heights'::character varying, 
								  'Iwaki'::character varying, 
								  'Ambattur'::character varying, 
								  'Shanwei'::character varying, 
								  'So Leopoldo'::character varying, 
								  'Teboksary'::character varying, 
								  'Tianjin'::character varying, 
								  'Cianjur'::character varying]::text[])
  							GROUP BY a.customer_id, e.country, d.city
  							ORDER BY (sum(b.amount)) DESC
 							LIMIT 5)
SELECT AVG(total_amount_paid) AS average_amount_paid
FROM average_total_paid_cte;

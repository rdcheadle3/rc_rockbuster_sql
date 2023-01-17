/* descriptive statistics
customer table */
SELECT MIN (customer_id) AS min_customer_id,
       MAX (customer_id) AS max_customer_id,
	   AVG (customer_id) AS avg_customer_id,
	   MIN (store_id) AS min_store_id,
       MAX (store_id) AS max_store_id,
	   AVG (store_id) AS avg_store_id,
	   MIN (address_id) AS min_address_id,
       MAX (address_id) AS max_address_id,
	   AVG (address_id) AS avg_address_id,
	   MIN (create_date) AS min_create_date,
       MAX (create_date) AS max_create_date,
	   MIN (last_update) AS min_last_update,
       MAX (last_update) AS max_last_update,
	   MIN (active) AS min_active,
       MAX (active) AS max_active,
	   AVG (active) AS avg_active,
	   mode() WITHIN GROUP (ORDER BY first_name) AS modal_first_name,
	   mode() WITHIN GROUP (ORDER BY last_name) AS modal_last_name,
	   mode() WITHIN GROUP (ORDER BY email) AS modal_email,
	   mode() WITHIN GROUP (ORDER BY activebool) AS modal_activebool
FROM customer;
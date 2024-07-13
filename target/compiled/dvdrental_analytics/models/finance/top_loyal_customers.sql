with customers_info as (
SELECT first_name ||' '|| last_name AS full_name, 
    address_id,
    customer_id,
    email
from dvdrentals.public.customer
),
final as(
    Select full_name,
     address, 
     phone, 
     city, 
     country, 
     sum(amount) AS total_purchase
FROM customers_info cs
JOIN dvdrentals.public.address ad
ON cs.address_id = ad.address_id
JOIN dvdrentals.public.city ct
ON ad.city_id = ct.city_id
JOIN dvdrentals.public.country cy
ON ct.country_id = cy.country_id
JOIN dvdrentals.public.payment pm
ON cs.customer_id = pm.customer_id
GROUP BY 1, 2, 3, 4, 5
ORDER BY 6 DESC
LIMIT 10
)

select * from final
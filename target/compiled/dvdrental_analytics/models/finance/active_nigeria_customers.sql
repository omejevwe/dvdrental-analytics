with active_customers as (
    select * from dev.public.active_customers_stg
),
final as (
    select * from active_customers as cs
    join dvdrentals.public.address as ad
    ON cs.address_id =  ad.address_id
    join dvdrentals.public.city as ct
    ON ad.city_id = ct.city_id
    join dvdrentals.public.country as cy
    ON cy.country_id = cy.country_id
)
select first_name, last_name, email, country
from final
where country = 'Nigeria'
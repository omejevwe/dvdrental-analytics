with active_customers as (
    select * from {{ ref('active_customers_stg')}}
),
final as (
    select * from active_customers as cs
    join {{ source('dvdrentals', 'address')}} as ad
    ON cs.address_id =  ad.address_id
    join {{ source('dvdrentals', 'city')}} as ct
    ON ad.city_id = ct.city_id
    join {{ source('dvdrentals', 'country')}} as cy
    ON cy.country_id = cy.country_id
)
select first_name, last_name, email, country
from final
where country = 'Nigeria' 

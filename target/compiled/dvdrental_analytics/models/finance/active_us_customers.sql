with active_customers as (
    select * from dev.public.active_customers_stg
),
final as (
    select * from active_customers
    join dvdrentals.public.address
    join dvdrentals.public.address
)
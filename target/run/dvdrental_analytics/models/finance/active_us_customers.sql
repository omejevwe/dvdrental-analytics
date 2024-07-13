
  
    

        create or replace transient table dev.public.active_us_customers
         as
        (with active_customers as (
    select * from dev.public.active_customers_stg
),
final as (
    select * from active_customers
    join dvdrentals.public.address
    join dvdrentals.public.address
)
        );
      
  
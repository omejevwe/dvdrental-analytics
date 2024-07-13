
  create or replace   view dvdrentals.public.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from dvdrentals.public.my_first_dbt_model
where id = 1
  );


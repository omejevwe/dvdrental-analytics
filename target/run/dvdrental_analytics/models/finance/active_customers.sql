
  
    

        create or replace transient table dev.public.active_customers
         as
        (with customer as  (
    select first_name,
    last_name,
    email,
    active
    
    from dvdrentals.public.customer
),
final as (
    select * from customer
    where active = 1
)
select * from final

























-- with cte_name as(
-- select from base_table),
-- cte_name2 as(
-- select from second_base_table)
-- final_as(select from base_table1 join base_table2)

-- select * from final
        );
      
  
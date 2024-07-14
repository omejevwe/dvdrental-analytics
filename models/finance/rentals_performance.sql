with rental_date_difference AS 
    (SELECT inventory_id, datediff('day', return_date, rental_date) AS date_difference
    from {{ source('dvdrentals', 'rental') }}),

final AS (SELECT f.film_id,
      CASE 
          WHEN rental_duration > date_difference THEN 'Returned early'
          WHEN rental_duration = date_difference THEN 'Returned on time'
          ELSE 'Returned late'
      END AS return_status
      from {{ source('dvdrentals', 'film')}} as f
      JOIN {{ source('dvdrentals', 'inventory')}} as i
      USING(film_id)
      JOIN rental_date_difference
      USING(inventory_id))

select return_status, count(film_id) total_films
from final 
group by 1
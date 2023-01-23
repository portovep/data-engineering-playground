with

library as (

    select * from {{ ref('stg_goodreads__library') }}

),


group_by_year_avg_rating as (

    select 
        date_part('year', date_read) as "year", 
        round(avg(rating)::numeric, 2) as my_avg_rating, 
        round(avg(avg_rating)::numeric, 2) as avg_rating
    from library
    where date_read IS NOT NULL
    group by "year"
    order by "year" DESC

)

select * from group_by_year_avg_rating
with

library as (

    select * from {{ ref('stg_goodreads__library') }}

),


group_by_year_watched as (

    select 
        date_part('year', date_read) as "year", 
        count(distinct(id)) as books_read 
    from library
    where date_read IS NOT NULL
    group by "year"
    order by "year" DESC

)

select * from group_by_year_watched
with

library as (

    select * from {{ ref('stg_goodreads__library') }}

),


group_by_year_pages as (

    select 
        date_part('year', date_read) as "year", 
        sum(pages_no) as total_pages,
        round(avg(pages_no)::numeric) as avg_pages
    from library
    where date_read IS NOT NULL
    group by "year"
    order by "year" DESC

)

select * from group_by_year_pages
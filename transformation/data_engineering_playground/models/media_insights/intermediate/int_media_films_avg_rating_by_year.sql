with

diary as (

    select * from {{ ref('stg_letterboxd__diary') }}

),


group_by_year_avg_rating as (

    select 
        date_part('year', watched_date) as "year", 
        round(avg(rating)::numeric, 2) as avg_rating 
    from diary
    group by date_part('year', watched_date)
    order by "year" DESC

)

select * from group_by_year_avg_rating
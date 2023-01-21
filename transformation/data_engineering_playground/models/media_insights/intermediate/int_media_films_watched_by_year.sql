with

diary as (

    select * from {{ ref('stg_letterboxd__diary') }}

),


group_by_year_watched as (

    select 
        date_part('year', watched_date) as "year", 
        count(name) as watched 
    from diary
    group by date_part('year', watched_date)
    order by "year" DESC

)

select * from group_by_year_watched
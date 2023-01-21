with

diary as (

    select * from {{ ref('stg_letterboxd__diary') }}

),


group_by_year_rewatched as (

    select 
        date_part('year', watched_date) as "year", 
        count(name) as rewatched 
    from diary
    where rewatch = 'Yes' OR tags ILIKE '%rewatch%'
    group by date_part('year', watched_date)
    order by "year" DESC

)

select * from group_by_year_rewatched
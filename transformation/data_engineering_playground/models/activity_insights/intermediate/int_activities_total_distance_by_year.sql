with

activities as (

    select * from {{ ref('stg_strava__activities') }}

),


group_distance_by_year_ as (

    select 
        date_part('year', date) as "year", 
        sum(distance) as distance_km
    from activities
    where type = 'Ride'
    group by "year"
    order by "year" DESC

)

select * from group_distance_by_year_
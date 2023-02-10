with

activities as (

    select * from {{ ref('stg_strava__activities') }}

),


group_distance_by_type as (

    select 
        type, 
        sum(distance) as distance_km,
        count(distance) as no_activities
    from activities
    group by type
    order by type DESC

)

select * from group_distance_by_type
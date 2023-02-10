with

activities as (

    select * from {{ ref('stg_strava__activities') }}

),


group_distance_by_type as (

    select 
        type, 
        sum(distance_km) as total_distance_km,
        avg(distance_km) as avg_distance_km,
        sum(elevation_gain_meters) as total_elevation_gain_meters,
        avg(elevation_gain_meters) as avg_elevation_gain_meters,
        avg(calories) as avg_calories,
        avg(activity_duration_seconds) as avg_activity_duration_seconds,
        max(max_speed_km_hour) as max_speed_km_hour,
        max(elevation_high_meters) as max_altitude_meters,
        count(distance_km) as no_activities
    from activities
    group by type
    order by type DESC

)

select * from group_distance_by_type
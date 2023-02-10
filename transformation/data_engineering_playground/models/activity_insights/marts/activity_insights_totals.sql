with


total_distance as (

    select * from {{ ref('int_activities_total_distance_by_type') }}

),

activitie_insights_totals as (

    select 
        type,
        total_distance_km,
        round(avg_distance_km::numeric, 2) as avg_distance_km,
        round(total_elevation_gain_meters::numeric, 2) as total_elevation_gain_meters,
        round(avg_elevation_gain_meters::numeric, 2) as avg_elevation_gain_meters,
        round(avg_calories::numeric, 2) as avg_calories,
        round(max_speed_km_hour::numeric, 2) as max_speed_km_hour,
        round(max_altitude_meters::numeric, 2) as max_altitude_meters,
        no_activities
    from total_distance
    order by type DESC
)

select * from activitie_insights_totals
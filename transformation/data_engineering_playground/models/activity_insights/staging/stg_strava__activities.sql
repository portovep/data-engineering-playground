with

source as (

    select * from {{ ref('raw_strava_activities_cleaned') }}

),

renamed as (

    select
        "Activity Type" as type,
        "Distance" as distance_km,
        "Elevation Gain" as elevation_gain_meters,
        "Elevation High" as elevation_high_meters,
        "Calories" as calories,
        "Elapsed Time" as activity_duration_seconds,
        "Max Speed" as max_speed_km_hour
    from source

)

select * from renamed

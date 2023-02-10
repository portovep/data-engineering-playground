with

source as (

    select * from {{ ref('raw_strava_activities_cleaned') }}

),

renamed as (

    select
        "Activity Type" as type,
        "Distance" as distance_km,
        "Elevation Gain" as elevation_gain_meters,
        "Calories" as calories
    from source

)

select * from renamed

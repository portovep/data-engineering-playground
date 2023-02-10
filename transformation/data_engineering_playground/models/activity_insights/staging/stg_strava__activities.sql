with

source as (

    select * from {{ ref('raw_strava_activities_cleaned') }}

),

renamed as (

    select
        "Activity Type" as type,
        "Distance" as distance
    from source

)

select * from renamed

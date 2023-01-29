with

source as (

    select * from {{ ref('raw_strava_activities') }}

),

renamed as (

    select
        "Activity Date" as date,
        "Activity Type" as type,
        "Distance" as distance
    from source

)

select * from renamed

with

source as (

    select * from {{ ref('raw_strava_activities_cleaned') }}

),

renamed as (

    select
        TO_DATE("Activity Date", 'DD/MM/YYYY') as date,
        "Activity Type" as type,
        "Distance" as distance
    from source

)

select * from renamed

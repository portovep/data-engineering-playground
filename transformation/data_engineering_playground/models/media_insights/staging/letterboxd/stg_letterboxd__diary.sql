with

source as (

    select * from {{ ref('raw_diary') }}

),

renamed as (

    select
        "Date" as date,
        "Name" as name,
        "Year" as year,
        "Letterboxd URI" as uri,
        "Rating" as rating,
        "Rewatch" as rewatch,
        "Tags" as tags,
        "Watched Date" as watched_date
    from source

)

select * from renamed

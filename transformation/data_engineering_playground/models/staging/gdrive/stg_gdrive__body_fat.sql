with

source as (

    select * from {{ ref('raw_body_fat') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        fat_mass_percentage
    from source

)

select * from renamed

with

source as (

    select * from {{ ref('height') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        height_cm
    from source

)

select * from renamed

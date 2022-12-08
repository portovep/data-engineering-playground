with

source as (

    select * from {{ ref('weight') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        weight_kg
    from source

)

select * from renamed

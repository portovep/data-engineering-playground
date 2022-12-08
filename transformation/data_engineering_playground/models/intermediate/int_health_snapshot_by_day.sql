with

height as (

    select * from {{ ref('stg_gdrive__height') }}

),

weight as (

    select * from {{ ref('stg_gdrive__weight') }}

),

enrich_with_last_height as (

    select distinct on (weight.created_date)
        weight.created_date,
        weight_kg,
        (select height_cm
         from height
         where  height.created_date < weight.created_date
         order by height.created_date DESC
         limit 1) as height_cm
    from weight
)

select * from enrich_with_last_height
with


total_distance as (

    select * from {{ ref('int_activities_total_distance_by_type') }}

),

activitie_insights_totals as (

    select 
        type,
        distance_km,
        no_activities
    from total_distance
    order by type DESC
)

select * from activitie_insights_totals
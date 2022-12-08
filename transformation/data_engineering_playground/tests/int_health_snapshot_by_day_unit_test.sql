{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('int_health_snapshot_by_day',
    'should enrich weight record with latest height record or null') %}
    
  {% call dbt_unit_testing.mock_ref ('stg_gdrive__weight') %}
    select
        to_date('2022-09-01', 'YYYY-MM-DD') as created_date,
        82.50 as weight_kg
    UNION ALL
    select
        to_date('2020-01-01', 'YYYY-MM-DD') as created_date,
        80.50 as weight_kg
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('stg_gdrive__height') %}
    select
        to_date('2021-07-01', 'YYYY-MM-DD') as created_date,
        182 as height_cm
    UNION ALL
    select
        to_date('2022-08-01', 'YYYY-MM-DD') as created_date,
        183 as height_cm
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2022/09/01', 'YYYY-MM-DD') as created_date,
        82.50 as weight_kg,
        183 as height_cm
    UNION ALL
    select
        to_date('2020/01/01', 'YYYY-MM-DD') as created_date,
        80.50 as weight_kg,
        null as height_cm
  {% endcall %}

{% endcall %}
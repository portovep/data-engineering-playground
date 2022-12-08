{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('stg_gdrive__height',
    'should cast string dates to dates') %}
    
  {% call dbt_unit_testing.mock_ref ('raw_height', {"input_format": "csv"}) %}
    date,height_cm
    '30/08/2022',182
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2022/08/30', 'YYYY-MM-DD') as created_date,
        182 as height_cm
  {% endcall %}

{% endcall %}
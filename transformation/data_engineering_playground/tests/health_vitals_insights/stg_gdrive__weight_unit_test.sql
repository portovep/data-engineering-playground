{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('stg_gdrive__weight',
    'should cast string dates to dates') %}
    
  {% call dbt_unit_testing.mock_ref ('raw_weight', {"input_format": "csv"}) %}
    date,weight_kg
    '01/07/2009',82.50
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        82.50 as weight_kg
  {% endcall %}

{% endcall %}
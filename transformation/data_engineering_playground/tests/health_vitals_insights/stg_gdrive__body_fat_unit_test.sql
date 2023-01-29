{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('stg_gdrive__body_fat',
    'should cast string dates to dates') %}
    
  {% call dbt_unit_testing.mock_ref ('raw_body_fat', {"input_format": "csv"}) %}
    date,fat_mass_percentage
    '01/07/2009',16
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('raw_body_fat', {"input_format": "csv"}) %}
    date,fat_mass_percentage
    '01/07/2009',16
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        16 as fat_mass_percentage
  {% endcall %}

{% endcall %}
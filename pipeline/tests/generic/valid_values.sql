{% test valid_values(model, column_name) %}
select 1 as failure
from {{ model }}
where {{ column_name }} not in (
    select key from {{ source('warehouse', 'census_2020_kb') }} where lower(column) = '{{ column_name }}'
)
{% endtest %}

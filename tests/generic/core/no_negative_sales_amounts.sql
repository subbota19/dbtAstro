{% test no_negative_sales_amounts(model) %}

{{ config(
    tags=["test"]
) }}

select *
from {{ model }}
where amount > 0

{% endtest %}
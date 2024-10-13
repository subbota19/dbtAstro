{% test no_negative_sales_amounts(model) %}

select *
from {{ model }}
where amount > 0

{% endtest %}
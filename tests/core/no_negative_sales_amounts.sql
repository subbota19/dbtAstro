select *
from {{ ref('core_sales') }}
where amount < 0

select
    customer_id,
    first_name,
    last_name,
    city,
    state
from {{ source('raw_src', 'raw_customers') }}

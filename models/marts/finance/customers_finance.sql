with

customers as (

    select * from {{ ref('dim_customers') }}

),

final as (

    select * from customers

)

select * from final

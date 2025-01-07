with

customers as (

    select * from {{ ref('dim_customers') }}

),

final as (

    select
        customers.customer_id,
        customers.first_order,
        customers.most_recent_order,
        customers.number_of_orders,
        customers.customer_lifetime_value

    from customers

)

select * from final

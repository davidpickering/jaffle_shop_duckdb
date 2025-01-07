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
        customers.total_amount as customer_lifetime_value

    from customers

)

select * from final

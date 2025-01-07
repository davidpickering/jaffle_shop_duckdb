with

customers as (

    select * from {{ ref('dim_customers') }}

),

final as (

    select
        customers.customer_id,

        customers.address_1,
        customers.address_2,
        customers.city,
        customers.state_code,
        customers.zip_code,

        customers.first_order,
        customers.most_recent_order,
        customers.number_of_orders

    from customers

)

select * from final

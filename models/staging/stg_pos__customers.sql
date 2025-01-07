with source as (

    select * from {{ ref('raw_cus') }}

),

renamed as (

    select
        id as customer_id,

        cus_name as name_first,
        surname as name_last,

        addr_line as address_1,
        addr_line2 as address_2,
        {{ standardize_address_city("city") }} as city,
        state as state_code,
        postal::varchar as zip_code,

        account_identifier as email,
        {{ scrub_phone_number("cell") }} as phone1

    from source
)

select * from renamed

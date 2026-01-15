{{ config(materialized='table') }}

WITH c1 as(
    select
    id as customer_id,
    first_name,
    last_name
    from {{source('datafeed_shared_schema','raw_customer')}}
    ),

    c2 as(
        select
        id ,
        customer_id,
        order_date,
        status
    from {{ref('orders_data')}}
    ),
    c3 as(
        select
        customer_id,
        status,
        min(order_date) as first_order,
        max(order_date) as max_order,
        count(id) as number_of_orders
        from c2
        group by customer_id,status
    ),

    c4 as (
        select * from {{ref('emp_data')}}
    ),

    final as(
        select
        c1.customer_id,
        c1.first_name,
        c3.first_order,
        c3.max_order,
        coalesce(c3.number_of_orders,0) as number_of_orders,
        c4.employee_id,
        from c1
        left join c3 using (customer_id)
        left join c4 using (customer_id)
    )

    select * from final

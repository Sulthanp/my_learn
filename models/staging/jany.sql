{{ config(materialized='table') }}

WITH tb1 as(
    select
    a.first_name as f_s_name,
    b.last_name as l_s_name
    from {{source('datafeed_shared_schema','jatt')}} as a
    left join {{ ref('customer_data') }} b
    on a.id=b.id
)
select * from tb1

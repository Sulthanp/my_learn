
{{ config(
    materialized="incremental",
    incremental_strategy="append",
) }}

select * from {{source('datafeed_shared_schema','raw_orders')}} where id in(1,2,3,4,5)
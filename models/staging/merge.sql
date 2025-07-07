{{ config(
materialized="incremental",
unique_key ='id',
incremental_strategy= "merge"
) }}
select * from {{source('datafeed_shared_schema','raw_orders')}} where id in (1,2,5,6,8)

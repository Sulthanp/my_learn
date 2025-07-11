{{ config(materialized='table') }}

WITH tb1 as(
    select 
    concat(l_orderkey, '---', l_linenumber) as line_key,
    l_orderkey as order_key,
    l_quantity as line_quantity
    from {{source('datafeed_shared_schema','raw_lineitem')}})
select * from tb1
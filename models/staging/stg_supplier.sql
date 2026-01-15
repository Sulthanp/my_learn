{{ config(materialized='table') }}

WITH tb1 as(
    select
S_SUPPKEY AS SUPPKEY ,
S_NAME	AS NAME,
S_ADDRESS AS ADDRESS,
S_NATIONKEY	AS NATIONKEY,
S_PHONE	AS PHONE,
S_ACCTBAL AS ACCTBAL,
S_COMMENT AS COMMENT
from {{source('datafeed_shared_schema','raw_supplier')}})
select * from tb1
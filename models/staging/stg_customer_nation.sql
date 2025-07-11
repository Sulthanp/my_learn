{{ config(materialized='table') }}

WITH tb1 as(
    select

C_CUSTKEY AS CUSTKEY,
C_NAME	AS NAME,
C_ADDRESS AS ADDRESS,
C_NATIONKEY	AS NATIONKEY,
C_PHONE	AS PHONE,
C_ACCTBAL AS ACCTBAL,
C_MKTSEGMENT AS MKTSEGMENT,
C_COMMENT AS COMMENT,
from {{source('datafeed_shared_schema','raw_customer_nation')}})
select * from tb1
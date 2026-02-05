{{ config(materialized='incremental') }}

{%- set source_model = "stg_finance_invoices" -%}
{%- set src_pk = "INVOICE_HK" -%}
{%- set src_hashdiff = "INVOICE_HASHDIFF" -%}
{%- set src_payload = ["AMOUNT", "CURRENCY", "INV_DATE", "VENDOR_NAME"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
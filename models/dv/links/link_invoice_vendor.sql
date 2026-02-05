{{ config(materialized='incremental') }}

{%- set source_model = "stg_finance_invoices" -%}
{%- set src_pk = "LINK_INVOICE_VENDOR_HK" -%}
{%- set src_fk = ["INVOICE_HK", "VENDOR_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, 
                    src_ldts=src_ldts, src_source=src_source,
                    source_model=source_model) }}
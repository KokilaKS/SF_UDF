{%- set yaml_metadata -%}
source_model: 
  raw_finance: 'raw_invoices'
derived_columns:
  RECORD_SOURCE: '!SF_RAW_FINANCE'
  LOAD_DATE: 'CURRENT_TIMESTAMP()'
hashed_columns:
  INVOICE_HK: 'INVOICE_ID'
  VENDOR_HK: 'VENDOR_ID'
  LINK_INVOICE_VENDOR_HK:
    - 'INVOICE_ID'
    - 'VENDOR_ID'
  INVOICE_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'AMOUNT'
      - 'CURRENCY'
      - 'VENDOR_NAME'
{%- endset -%}

{% set metadata = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                        source_model=metadata['source_model'],
                        derived_columns=metadata['derived_columns'],
                        hashed_columns=metadata['hashed_columns']) }}

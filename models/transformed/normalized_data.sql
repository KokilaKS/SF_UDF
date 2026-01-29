{{ config(materialized='table') }}

 SELECT record_id, input_date, 
 {{ target.database }}.UTILS.smart_date(input_date)
  AS normalized_date, 
  amount_text,
   status_text,
    phone_text
 FROM {{ ref('raw_source_data') }}
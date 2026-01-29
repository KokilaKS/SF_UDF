/*SELECT
    record_id,
    input_date,
    amount_text,
    status_text,
    phone_text
FROM UDF_DEMO_DB.RAW.SOURCE_DATA*/

SELECT
    record_id,
    input_date,
    amount_text,
    status_text,
    phone_text
FROM {{ source('transformed_raw', 'SOURCE_DATA') }}


{{ config(materialized='view') }}

SELECT
    h.INVOICE_ID,
    s.AMOUNT,
    s.VENDOR_NAME,
    s.INV_DATE,
    s.LOAD_DATE AS EFFECTIVE_FROM
FROM {{ ref('hub_invoice') }} h
INNER JOIN {{ ref('sat_invoice_details') }} s 
    ON h.INVOICE_HK = s.INVOICE_HK
WHERE s.LOAD_DATE = (
    SELECT MAX(LOAD_DATE) 
    FROM {{ ref('sat_invoice_details') }}
    WHERE INVOICE_HK = h.INVOICE_HK
)
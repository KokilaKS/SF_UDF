{{ config(materialized='view') }}

SELECT
    h_i.INVOICE_ID,
    h_v.VENDOR_ID,
    s.AMOUNT,
    s.INV_DATE,
    l.LOAD_DATE AS RELATIONSHIP_START_DATE
FROM {{ ref('link_invoice_vendor') }} l
INNER JOIN {{ ref('hub_invoice') }} h_i 
    ON l.INVOICE_HK = h_i.INVOICE_HK
INNER JOIN {{ ref('hub_vendor') }} h_v 
    ON l.VENDOR_HK = h_v.VENDOR_HK
INNER JOIN {{ ref('sat_invoice_details') }} s 
    ON h_i.INVOICE_HK = s.INVOICE_HK
WHERE s.LOAD_DATE = (
    SELECT MAX(LOAD_DATE) 
    FROM {{ ref('sat_invoice_details') }}
    WHERE INVOICE_HK = h_i.INVOICE_HK
)
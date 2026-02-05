SELECT
    -- Hash Keys
    MD5(UPPER(TRIM(PAYMENT_ID))) AS PAYMENT_HK,
    MD5(UPPER(TRIM(INVOICE_ID))) AS INVOICE_HK, -- We need this to link Payment to Invoice

    -- Hash Diff (The 'Fingerprint' for the payment details)
    MD5(CONCAT(
        IFNULL(CAST(PAY_AMOUNT AS STRING), ''), 
        IFNULL(METHOD, '')
    )) AS PAYMENT_HASHDIFF,

    -- Original Business Keys
    PAYMENT_ID,
    INVOICE_ID,

    -- Descriptive Attributes
    PAY_DATE,
    PAY_AMOUNT,
    METHOD,

    -- Metadata
    CURRENT_TIMESTAMP() AS LOAD_DATE,
    'SF_RAW_FINANCE' AS RECORD_SOURCE
FROM {{ source('raw_finance', 'raw_payments') }}
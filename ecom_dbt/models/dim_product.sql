SELECT DISTINCT
  StockCode,
  Description
FROM {{ source('ecommerce_raw', 'cleansed_sales') }}
WHERE StockCode IS NOT NULL
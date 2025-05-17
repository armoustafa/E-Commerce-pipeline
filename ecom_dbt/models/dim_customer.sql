SELECT DISTINCT
  CustomerID
FROM {{ source('ecommerce_raw', 'cleansed_sales') }}
WHERE CustomerID IS NOT NULL
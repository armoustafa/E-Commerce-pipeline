SELECT DISTINCT
  CustomerID AS customer_key
FROM {{ ref('cleansed_sales') }}
WHERE CustomerID IS NOT NULL
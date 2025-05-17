SELECT
  StockCode AS product_key,
  MAX(Description) AS Description 
FROM {{ ref('cleansed_sales') }}
WHERE StockCode IS NOT NULL
GROUP BY StockCode
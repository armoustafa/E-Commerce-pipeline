SELECT
  s.InvoiceNo,
  s.StockCode AS product_key,
  s.InvoiceDate AS date_key,
  s.CustomerID AS customer_key,
  s.Quantity,
  s.UnitPrice,
  s.Quantity * s.UnitPrice AS total_amount
FROM {{ source('ecommerce_raw', 'cleansed_sales') }} s
WHERE s.Quantity > 0
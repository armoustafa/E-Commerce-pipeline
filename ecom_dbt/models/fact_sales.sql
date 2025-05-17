SELECT
  InvoiceNo,
  s.StockCode AS product_key,
  DATE(s.InvoiceDate) AS date_key,  -- Cast to DATE to match dim_date
  s.CustomerID AS customer_key,
  s.Quantity,
  s.UnitPrice,
  s.Quantity * s.UnitPrice AS total_amount
FROM {{ ref('cleansed_sales') }} s
WHERE s.Quantity > 0
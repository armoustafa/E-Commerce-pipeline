SELECT DISTINCT
  DATE(InvoiceDate) AS date_day,
  EXTRACT(YEAR FROM InvoiceDate) AS year,
  EXTRACT(MONTH FROM InvoiceDate) AS month,
  EXTRACT(DAY FROM InvoiceDate) AS day,
  TO_CHAR(InvoiceDate, 'YYYY-MM') AS year_month
FROM {{ source('ecommerce_raw', 'cleansed_sales') }}
WHERE InvoiceDate IS NOT NULL
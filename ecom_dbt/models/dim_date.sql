SELECT DISTINCT
  DATE(InvoiceDate) AS date_key,
  EXTRACT(YEAR FROM InvoiceDate) AS year,
  EXTRACT(MONTH FROM InvoiceDate) AS month,
  EXTRACT(DAY FROM InvoiceDate) AS day,
  TO_CHAR(InvoiceDate, 'YYYY-MM') AS year_month,
  EXTRACT(DAYOFWEEK FROM InvoiceDate) AS day_of_week
FROM {{ ref('cleansed_sales') }}
WHERE InvoiceDate IS NOT NULL
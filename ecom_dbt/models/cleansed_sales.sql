


  SELECT
    InvoiceNo,
    StockCode,
    Description,
    CASE 
      WHEN Quantity < 0 THEN 0
      ELSE Quantity 
    END AS Quantity,
    TO_TIMESTAMP(InvoiceDate, 'YYYY-MM-DD HH24:MI:SS') AS InvoiceDate,
    UnitPrice,
    COALESCE(CustomerID, 'UNKNOWN') AS CustomerID
  FROM ECOMMERCE_DB.RAW.raw_sales
  WHERE InvoiceNo IS NOT NULL

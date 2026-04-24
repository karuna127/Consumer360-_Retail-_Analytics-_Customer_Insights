SELECT schema_name
FROM information_schema.schemata;
--create table--
CREATE TABLE retail.retail_sales (

    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID INT,
    Country VARCHAR(50)

);
--check table--
SELECT *FROM retail.retail_sales LIMIT 10;
-- import dataset--
--create table--
CREATE TABLE retail.retail_sales (

    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID INT,
    Country VARCHAR(50)

);
SELECT *
FROM retail.retail_sales
LIMIT 10;
--clean data--
DELETE FROM retail.retail_sales
WHERE customerid IS NULL;
--remove negative quantity--
DELETE FROM retail.retail_sales
WHERE quantity <= 0;
--count total rows--
SELECT COUNT(*) 
FROM retail.retail_sales;
--unique invoice--
SELECT COUNT(DISTINCT invoiceno)
FROM retail.retail_sales;
SELECT COUNT(DISTINCT customerid)
FROM retail.retail_sales;
SELECT COUNT(DISTINCT stockcode)
FROM retail.retail_sales;
SELECT MIN(invoicedate), MAX(invoicedate)
FROM retail.retail_sales;
--create revenue column--
ALTER TABLE retail.retail_sales
ADD COLUMN revenue NUMERIC;
UPDATE retail.retail_sales
SET revenue = quantity * unitprice;
--sales trend (monthly revenue trend)--
SELECT
DATE_TRUNC('month', invoicedate) AS month,
SUM(revenue) AS total_sales
FROM retail.retail_sales
GROUP BY month
ORDER BY month;
--top 10 best-selling products--
SELECT
description,
SUM(quantity) AS total_quantity
FROM retail.retail_sales
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 10;
--revenue by country--
SELECT
country,
SUM(revenue) AS total_revenue
FROM retail.retail_sales
GROUP BY country
ORDER BY total_revenue DESC;
--check table--
SELECT *FROM retail.retail_sales LIMIT 10;
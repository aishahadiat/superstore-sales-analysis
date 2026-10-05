-- jalankan sekali saja
-- ALTER TABLE Sales ADD COLUMN order_date_clean TEXT;
-- UPDATE Sales SET order_date_clean =
--   substr("Order Date", -4) || '-' ||
--   printf('%02d', CAST(substr("Order Date", 1, instr("Order Date", '/') - 1) AS INTEGER)) || '-' ||
--   printf('%02d', CAST(substr(substr("Order Date", instr("Order Date", '/') + 1), 1,
--     instr(substr("Order Date", instr("Order Date", '/') + 1), '/') - 1) AS INTEGER));

SELECT COUNT(*) AS jumlah_baris, ROUND(SUM(Sales), 2) AS total_sales FROM Sales;

SELECT Category,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM Sales
GROUP BY Category
ORDER BY total_sales DESC;

SELECT "Sub-Category",
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM Sales
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY total_profit ASC;

SELECT "Sub-Category",
       CASE
         WHEN Discount = 0 THEN '1. Tanpa diskon'
         WHEN Discount <= 0.2 THEN '2. Diskon kecil (<=20%)'
         ELSE '3. Diskon besar (>20%)'
       END AS kelompok_diskon,
       COUNT(*) AS jumlah_transaksi,
       ROUND(SUM(Profit), 2) AS total_profit
FROM Sales
WHERE "Sub-Category" IN ('Tables', 'Bookcases')
GROUP BY "Sub-Category", kelompok_diskon
ORDER BY "Sub-Category", kelompok_diskon;

SELECT CASE
         WHEN Discount = 0 THEN '1. Tanpa diskon'
         WHEN Discount <= 0.2 THEN '2. Diskon kecil (<=20%)'
         ELSE '3. Diskon besar (>20%)'
       END AS kelompok_diskon,
       COUNT(*) AS jumlah_transaksi,
       ROUND(AVG(Profit), 2) AS rata_rata_profit,
       ROUND(SUM(Profit), 2) AS total_profit
FROM Sales
GROUP BY kelompok_diskon
ORDER BY kelompok_diskon;

SELECT Region,
       COUNT(DISTINCT "Order ID") AS jumlah_order,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM Sales
GROUP BY Region
ORDER BY total_profit DESC;

SELECT Region,
       COUNT(*) AS jumlah_transaksi,
       SUM(CASE WHEN Discount > 0.2 THEN 1 ELSE 0 END) AS transaksi_diskon_besar,
       ROUND(SUM(CASE WHEN Discount > 0.2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_diskon_besar,
       ROUND(SUM(Profit), 2) AS total_profit
FROM Sales
GROUP BY Region
ORDER BY pct_diskon_besar DESC;

SELECT strftime('%Y-%m', order_date_clean) AS bulan,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM Sales
GROUP BY bulan
ORDER BY bulan;
# Superstore Sales Analysis: Dampak Diskon terhadap Profit

Proyek latihan analisis data penjualan toko ritel (2014-2017) pakai SQL dan Excel. Data dari Kaggle: [Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final), isinya 9.994 transaksi.

![Dashboard](dashboard%20superstore.png)

## Awalnya

Waktu lihat sales per kategori, Furniture sales-nya hampir sama besar dengan Technology, tapi profitnya cuma 18 ribuan (margin 2,49%, sementara Technology 17,4%). Dari situ aku mulai cari tahu kenapa.

## Yang ketemu

Ternyata yang bikin tipis itu Tables dan Bookcases, dua-duanya rugi (Tables -17.725, Bookcases -3.473). Waktu aku pecah berdasarkan besar diskon, kelihatan transaksi dengan diskon di atas 20% yang bikin rugi. Contohnya Tables: tanpa diskon untung 13.276, tapi yang diskon besar rugi 30.698.

Pas kucek ke seluruh toko, polanya sama. Rata-rata profit per transaksi 66,9 kalau tanpa diskon, 26,5 kalau diskon sampai 20%, dan -97,18 kalau diskon lebih dari 20%. Ada 1.393 transaksi diskon besar dengan total rugi 135.376.

Dari sisi region, Central paling sering kasih diskon besar (27,68% transaksinya) dan profitnya paling kecil. West kebalikannya, diskon besar cuma 3,68% dan profitnya paling tinggi. East dan South polanya nggak serapi itu, jadi aku cuma pakai Central dan West sebagai contoh.

## Kesimpulan

Diskon di atas 20% sebaiknya ditinjau lagi, terutama untuk Tables, Bookcases, dan region Central. Diskon kecil masih untung, jadi masih aman.

Catatan: ini baru hubungan antara diskon dan rugi, belum tentu diskon penyebab satu-satunya. Bisa jadi produk yang didiskon besar memang margin awalnya sudah tipis. Datanya juga data contoh dari Kaggle, bukan data perusahaan beneran.

## Cara kerjanya

CSV diimpor ke SQLite lewat DB Browser. Format tanggal awalnya m/d/yyyy, jadi kuubah dulu ke yyyy-mm-dd. Setelah itu kucek jumlah baris dan total sales, cocok dengan data aslinya. Query analisisnya ada di `analisis_superstore.sql`, hasilnya kuekspor ke Excel buat dibikin dashboard (`dashboard superstore.xlsx`).

Tools: SQL (SQLite), Excel

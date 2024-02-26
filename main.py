import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine

# Membuat koneksi ke database
engine = create_engine('mysql+pymysql://root:@localhost/da_sales_tech')

# Analisis tren penjualan dari bulan ke bulan
query_tren_penjualan = """
SELECT MONTH(order_date) AS bulan, SUM(total_payment) AS total_penjualan
FROM Orders
WHERE order_date BETWEEN '2024-02-01' AND '2024-04-25'
GROUP BY MONTH(order_date)
"""

# Membaca data dari database
dtp = pd.read_sql_query(query_tren_penjualan, engine)

# Segmentasi pelanggan
query_segmentasi_pelanggan = """
SELECT
    CASE
        WHEN total_pembelian >= 1000 THEN 'Pelanggan Loyal'
        WHEN total_pembelian >= 500 THEN 'Pelanggan Reguler'
        ELSE 'Pelanggan Baru'
    END AS segmentasi,
    COUNT(customer_id) AS jumlah_pelanggan
FROM (
    SELECT customer_id, SUM(total_payment) AS total_pembelian
    FROM Orders
    GROUP BY customer_id
) AS pembelian_pelanggan
GROUP BY segmentasi"""

# Membaca data dari database
dsp = pd.read_sql_query(query_segmentasi_pelanggan, engine)

# Produk terlaris
query_produk_terlaris = """
SELECT
    product_name,
    SUM(quantity) AS total_penjualan
FROM OrderDetails
JOIN Products ON OrderDetails.product_id = Products.product_id
GROUP BY product_name
ORDER BY total_penjualan DESC
LIMIT 5;
"""

# Membaca data dari database
dpt = pd.read_sql_query(query_produk_terlaris, engine)

# Plotting
plt.figure(figsize=(16, 6))

# Plot tren penjualan
plt.subplot(1, 3, 1)
sns.lineplot(data=dtp, x='bulan', y='total_penjualan', marker='o')
plt.title('Tren Penjualan')
plt.xlabel('Bulan')
plt.ylabel('Total Penjualan')

# Plot segmentasi pelanggan
plt.subplot(1, 3, 2)
plt.pie(dsp['jumlah_pelanggan'], labels=dsp['segmentasi'], autopct='%1.1f%%', startangle=140)
plt.title('Segmentasi Pelanggan')

# Plot produk terlaris
plt.subplot(1, 3, 3)
sns.barplot(data=dpt, x='total_penjualan', y='product_name', palette='viridis')
plt.title('Produk Terlaris')
plt.xlabel('Total Penjualan')
plt.ylabel('Nama Produk')

plt.tight_layout()
plt.show()

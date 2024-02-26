import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
import numpy as np

engine = create_engine('mysql+pymysql://root:@localhost/da_sales_tech')

# Analisis tren penjualan dari bulan ke bulan
query_tren_penjualan = """
SELECT MONTH(order_date) AS bulan, SUM(total_payment) AS total_penjualan
FROM Orders
WHERE order_date BETWEEN '2024-02-01' AND '2024-04-25'
GROUP BY MONTH(order_date)
"""

dtp = pd.read_sql_query(query_tren_penjualan, engine)
x_dtp = dtp['bulan']
y_dtp = dtp['total_penjualan']

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

dsp = pd.read_sql_query(query_segmentasi_pelanggan, engine)
y_dsp = np.array(dsp['jumlah_pelanggan'])
mylabel = list(dsp['segmentasi'])

# Produk terlaris
query_produk_terlaris = """
SELECT
    product_name,
    SUM(quantity) AS total_penjualan,
    SUM(unit_price * quantity) AS total_pendapatan
FROM OrderDetails
JOIN Products ON OrderDetails.product_id = Products.product_id
GROUP BY product_name
ORDER BY total_penjualan DESC, total_pendapatan DESC;
"""
dpt = pd.read_sql_query(query_produk_terlaris, engine)
dpt_head = dpt.head()
dpt_tail = dpt.tail()
x_dpt = np.array(list(dpt_tail['product_name']))
y_dpt = np.array(dpt_tail['total_penjualan'])

# Plotting
fig, axs = plt.subplots(1, 3, figsize=(15, 5))

# Plot tren penjualan
axs[0].plot(x_dtp, y_dtp)
axs[0].set_title('Tren Penjualan')
axs[0].set_xlabel('Bulan')
axs[0].set_ylabel('Total Penjualan')

# Plot segmentasi pelanggan
axs[1].pie(y_dsp, labels=mylabel, autopct='%1.1f%%')
axs[1].set_title('Segmentasi Pelanggan')

# Plot produk terlaris
axs[2].bar(x_dpt, y_dpt)
axs[2].set_title('Produk Terlaris')
axs[2].set_xlabel('Nama Produk')
axs[2].set_ylabel('Total Penjualan')

plt.tight_layout()
plt.show()

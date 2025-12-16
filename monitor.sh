#!/bin/bash

# --- VERİLERİ TOPLA ---
# 1. Tarih ve Saat
TARIH=$(date)

# 2. CPU Kullanımı (User + System kullanımını toplar)
CPU_KULLANIM=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# 3. RAM Durumu (Megabyte cinsinden)
RAM_TOPLAM=$(free -m | grep Mem | awk '{print $2}')
RAM_KULLANILAN=$(free -m | grep Mem | awk '{print $3}')

# 4. Disk Alanı (Kök dizin / için)
DISK_TOPLAM=$(df -h / | tail -1 | awk '{print $2}')
DISK_DOLULUK=$(df -h / | tail -1 | awk '{print $5}')

# 5. Aktif Kullanıcı Sayısı
AKTIF_KULLANICI=$(who | wc -l)

# --- HTML OLUŞTUR VE KAYDET ---
# > işareti dosyayı sıfırlar ve yazar, >> ekleme yapar.

echo "<html>" > /var/www/html/index.html
echo "<head><title>Sunucu Durum Paneli</title>" >> /var/www/html/index.html
echo "<meta charset='UTF-8'>" >> /var/www/html/index.html
echo "<style>body { font-family: Arial; padding: 20px; } .card { border: 1px solid #ccc; padding: 10px; margin: 10px 0; border-radius: 5px; background-color: #f9f9f9; }</style>" >> /var/www/html/index.html
echo "</head><body>" >> /var/www/html/index.html

echo "<h1>Linux Sunucu Durum Paneli</h1>" >> /var/www/html/index.html
echo "<p><strong>Rapor Saati:</strong> $TARIH</p>" >> /var/www/html/index.html
echo "<hr>" >> /var/www/html/index.html

echo "<div class='card'>" >> /var/www/html/index.html
echo "<h3>🖥️ CPU Durumu</h3>" >> /var/www/html/index.html
echo "<p>CPU Kullanımı: <strong>%$CPU_KULLANIM</strong></p>" >> /var/www/html/index.html
echo "</div>" >> /var/www/html/index.html

echo "<div class='card'>" >> /var/www/html/index.html
echo "<h3>🧠 RAM Durumu</h3>" >> /var/www/html/index.html
echo "<p>Toplam RAM: $RAM_TOPLAM MB</p>" >> /var/www/html/index.html
echo "<p>Kullanılan RAM: <strong>$RAM_KULLANILAN MB</strong></p>" >> /var/www/html/index.html
echo "</div>" >> /var/www/html/index.html

echo "<div class='card'>" >> /var/www/html/index.html
echo "<h3>💾 Disk Alanı</h3>" >> /var/www/html/index.html
echo "<p>Toplam Alan: $DISK_TOPLAM</p>" >> /var/www/html/index.html
echo "<p>Doluluk Oranı: <strong>$DISK_DOLULUK</strong></p>" >> /var/www/html/index.html
echo "</div>" >> /var/www/html/index.html

echo "<div class='card'>" >> /var/www/html/index.html
echo "<h3>busts in silhouette Aktif Kullanıcılar</h3>" >> /var/www/html/index.html
echo "<p>Şu an bağlı kullanıcı sayısı: <strong>$AKTIF_KULLANICI</strong></p>" >> /var/www/html/index.html
echo "</div>" >> /var/www/html/index.html

echo "<p><small>Otomatik oluşturuldu: monitor.sh</small></p>" >> /var/www/html/index.html
echo "</body></html>" >> /var/www/html/index.html
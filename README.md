# Linux Sunucu Durum Paneli (Server Dashboard)

## 📌 Proje Hakkında
Bu proje, **Bilişim Sistemleri Altyapı ve Teknolojileri** dersi dönem projesi kapsamında geliştirilmiştir. Projenin amacı; Linux komut satırı araçlarını kullanarak sunucunun anlık sağlık durumunu (CPU, RAM, Disk, Kullanıcılar) takip eden ve bu verileri bir web arayüzünde raporlayan bir otomasyon sistemi kurmaktır .

Proje, **WSL (Windows Subsystem for Linux)** üzerinde Ubuntu işletim sistemi kullanılarak hazırlanmıştır.

---

## ⚙️ Kurulum ve Gerekli Paketler
Projenin çalışması için aşağıdaki adımlar uygulanmış ve gerekli paketler kurulmuştur:

1.  **Web Sunucusu Kurulumu:**
    Sisteme **Apache2** web sunucusu kurulmuştur.
    ```bash
    sudo apt install apache2 -y
    ```

2.  **Servis Kontrolü:**
    Apache servisinin çalıştığı `systemctl status apache2` komutu ile doğrulanmıştır .

3.  **İzinlerin Ayarlanması:**
    Scriptin HTML dosyası oluşturabilmesi için `/var/www/html` dizinine gerekli yazma izinleri verilmiştir .

---

## 📝 Script ve Çalışma Mantığı (monitor.sh)
Hazırlanan `monitor.sh` isimli Bash scripti, sistemden şu verileri çeker ve `/var/www/html/index.html` dosyasını oluşturur:

* **Tarih ve Saat:** Raporun oluşturulduğu an.
* **CPU Kullanımı:** `top` komutu ile işlemci yükü hesaplanır.
* **RAM Durumu:** `free -m` komutu ile kullanılan ve boş bellek miktarı alınır.
* **Disk Alanı:** `df -h` komutu ile disk doluluk oranı çekilir.
* **Aktif Kullanıcılar:** `who` komutu ile sisteme bağlı kullanıcı sayısı belirlenir.

---

## ⏰ Otomasyon Ayarı
Scriptin manuel çalıştırılması yerine, her dakika otomatik olarak güncellenmesi için **Crontab** kullanılmıştır .

**Yapılan Cron Ayarı:**
Terminalde `crontab -e` komutu ile aşağıdaki satır eklenmiştir:

```bash
* * * * * /home/eda/monitor.sh
```
---

## 📊 Proje Ekran Görüntüsü
Aşağıda, scriptin ürettiği ve tarayıcıda görüntülenen sunucu durum paneli yer almaktadır:

![Linux Dashboard Ekran Görüntüsü](screenshot.png)

---

Öğrenci Bilgileri
Ad Soyad: Eda GÖRPÜZ
Öğrenci No: B241200015
Ders: Bilişim Sistemleri Altyapı ve Teknolojileri

# Linux Sunucu Durum Paneli (Server Dashboard)

## 📋 Proje Tanıtımı
Bu proje, **Bilişim Sistemleri Altyapı ve Teknolojileri** dersi dönem projesi kapsamında hazırlanmıştır. Amaç, Linux tabanlı bir sunucuda (veya WSL ortamında) sistemin sağlık durumunu (CPU, RAM, Disk, Kullanıcılar) izleyen ve bu verileri web tabanlı bir arayüzde otomatik olarak güncelleyen bir otomasyon geliştirmektir.

Proje, Bash script programlama ve Cronjob zamanlayıcısı kullanılarak gerçekleştirilmiştir.

---

## ⚙️ Kurulum ve Kullanılan Paketler
Proje geliştirme sürecinde aşağıdaki ortam ve paketler kullanılmıştır:

* **İşletim Sistemi:** Ubuntu (WSL - Windows Subsystem for Linux üzerinde)
* **Web Sunucusu:** Apache2
    * Kurulum Komutu: `sudo apt install apache2 -y`
* **Editör:** Nano / VS Code

Web sunucusunun çalışırlığı `systemctl status apache2` komutu ile doğrulanmış ve `/var/www/html` dizinine yazma izinleri yapılandırılmıştır.

---

## 📄 Script Detayları (monitor.sh)
`monitor.sh` isimli Bash scripti, sistemden aşağıdaki verileri çeker:
1.  **Tarih/Saat:** `date` komutu.
2.  **CPU Kullanımı:** `top` ve `grep` komutları ile filtrelenmiş veri.
3.  **RAM Durumu:** `free -m` komutu.
4.  **Disk Alanı:** `df -h` komutu.
5.  **Aktif Kullanıcılar:** `who` komutu.

Script, bu verileri HTML formatına dönüştürerek `/var/www/html/index.html` dosyasını her çalıştırıldığında yeniden oluşturur.

---

## ⏰ Otomasyon ve Cron Ayarı
Sistemin manuel müdahale olmadan sürekli güncel kalması için **Crontab** kullanılmıştır. Scriptin her dakika (dakikada bir) otomatik çalışması sağlanmıştır.

**Yapılan Cron Ayarı:**
Terminalde `crontab -e` komutu ile konfigürasyon dosyası açılmış ve aşağıdaki satır eklenmiştir:

```bash
* * * * * /home/eda/monitor.sh

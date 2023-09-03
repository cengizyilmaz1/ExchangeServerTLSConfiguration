ExchangeServerTLSConfiguration
Hakkında
ExchangeServerTLSConfiguration isimli bu PowerShell betiği, Microsoft Exchange sunucularında TLS (Transport Layer Security) sürümlerini yapılandırmak için bir araçtır. Bu betik, TLS 1.2'yi etkinleştirmeyi ve eski TLS sürümlerini devre dışı bırakmayı kolay ve otomatik bir hale getirir.

Özellikler
TLS 1.2'nin etkinleştirilmesi
Eski TLS sürümlerinin (TLS 1.0, TLS 1.1) devre dışı bırakılması
.NET Framework 3.5 ve 4.5 için güçlü kripto ayarlarının etkinleştirilmesi
Başlarken
Bu rehber, scriptin nasıl çalıştırılacağını adım adım göstermektedir.

Ön Şartlar
Windows tabanlı bir sistem
PowerShell'in kurulu olması
Yönetici hakları
Kurulum
GitHub reposunun ana sayfasından ExchangeServerTLSConfiguration.ps1 dosyasını indirin.
İndirdiğiniz dosyayı bir klasöre çıkarın.
PowerShell'i yönetici olarak çalıştırın.
Çalıştırdığınız PowerShell penceresinde scriptin bulunduğu klasöre gidin:
.\ExchangeServerTLSConfiguration.ps1

Kullanımı
Scripti çalıştırdıktan sonra karşınıza bir menü gelecektir. Bu menüde şunları yapabilirsiniz:

TLS 1.2'yi etkinleştir: Bu seçeneği seçerek TLS 1.2'yi etkinleştirir.
Diğer TLS Sürümlerini devre dışı bırak: Bu seçeneği seçerek TLS 1.0 ve 1.1'i devre dışı bırakır.
Çıkış: Bu seçeneği seçerek betikten çıkarsınız.
Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - detaylar için LICENSE.md dosyasına bakınız.

Katkıda Bulunma
Katkıda bulunmak istiyorsanız, lütfen bir 'pull request' gönderin. İyileştirmeler ve hata düzeltmeleri her zaman hoş karşılanır.

İletişim
Sorularınız ve geri bildirimleriniz için lütfen Issues kısmını kullanın.

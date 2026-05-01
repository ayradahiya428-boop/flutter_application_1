# Sistem Informasi Pesantren Nurul Falah Pusat

Aplikasi ini dikembangkan sebagai proyek **UAS Pemrograman Mobile** untuk mengelola data operasional pesantren secara digital.

## 📋 Blueprint Sistem

**Pengembang:** Irfan Mansyur  
**NPM:** 20241220123  
**Prodi:** Teknik Informatika (Kelas B. TI)

### 1. Arsitektur Kode
Aplikasi dibangun menggunakan framework **Flutter** dengan bahasa pemrograman **Dart**. Struktur kode menggunakan `StatefulWidget` untuk manajemen state dinamis.

### 2. Fitur Utama (Navigation Tabs)
Aplikasi ini memiliki 4 navigasi utama:
*   **Data Santri**: Manajemen informasi santri dan lokasi kamar.
*   **Data Pengurus**: Manajemen data staf dan jabatan pengurus.
*   **Inventaris**: Monitoring jumlah dan kondisi barang pesantren.
*   **Profil**: Informasi identitas pengembang sistem.

### 3. Logika Bisnis & Penyimpanan
*   **Data Persistence**: Menggunakan `AutomaticKeepAliveClientMixin` untuk menjaga state data tetap ada saat berpindah tab.
*   **Input System**: Menggunakan `AlertDialog` dan `TextEditingController` untuk menangkap input pengguna secara real-time.

### 4. Lingkungan Pengembangan
*   **Editor**: Visual Studio Code
*   **Framework**: Flutter 3.x
*   **Platform**: Web/Android
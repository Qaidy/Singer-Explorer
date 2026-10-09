# 🎤 Singer Explorer

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

**Singer Explorer** adalah aplikasi mobile berbasis Flutter yang berfungsi sebagai ensiklopedia artis/penyanyi populer. Terinspirasi oleh desain UI dan navigasi bersih bergaya ensiklopedia modern, aplikasi ini memungkinkan pengguna menjelajahi profil penyanyi, membaca biografi, melihat daftar lagu populer, serta mengelola artis favorit secara interaktif.

---

## ✨ Fitur Utama

- **📋 Daftar Penyanyi Interaktif (Home Page)**
  - Menampilkan daftar penyanyi dengan foto profil bulat (*circular avatar*).
  - Dilengkapi *genre pill badge* yang rapi dan estetis.
  - Indikator favorit langsung di setiap kartu artis.
- **🔍 Halaman Detail Lengkap (Detail Page)**
  - Foto profil artis beresolusi tinggi dengan sudut membulat dan animasi *Hero transition*.
  - Kartu informasi artis: Nama, Genre, Tanggal Lahir, Kewarganegaraan, dan Masa Aktif.
  - Biografi singkat artis.
  - Bagian **Popular Songs** dengan ikon bintang dan desain baris melengkung (*rounded rows*).
- **❤️ Manajemen Favorit (Favorites)**
  - Tandai dan hapus artis dari daftar favorit secara *real-time*.
  - Sinkronisasi status favorit langsung antara Home Page dan Detail Page.
  - Filter daftar di Home Page untuk menampilkan artis favorit saja.
- **📱 Desain Responsif & Ramah Pengguna**
  - Mengikuti pedoman Material 3 dengan palet warna bersih, tipografi tegas, dan minim *shadow*.
  - Dukungan *scroll* mulus untuk berbagai ukuran layar.

---

## 🌟 Daftar Artis

Aplikasi ini memuat data dan profil dari 8 musisi ternama:

1. **Sabrina Carpenter** — *Pop*
2. **Taylor Swift** — *Pop*
3. **Olivia Rodrigo** — *Pop / Alternative*
4. **Drake** — *Hip-Hop / R&B*
5. **The Weeknd** — *R&B / Pop*
6. **Kanye West** — *Hip-Hop / Rap*
7. **Malcolm Todd** — *Indie Pop / Alternative*
8. **Rex Orange County** — *Indie Pop / Alternative*

---

## 📁 Struktur Direktori

```text
singer_explorer/
├── assets/                  # Foto lokal setiap penyanyi (.jpeg)
├── lib/
│   ├── data/
│   │   └── singers.dart     # Data statis & biografi 8 artis
│   ├── models/
│   │   └── singer.dart      # Model data Singer
│   ├── pages/
│   │   ├── home_page.dart   # Halaman utama dengan daftar penyanyi & filter favorit
│   │   └── detail_page.dart # Halaman detail profil penyanyi
│   ├── widgets/
│   │   └── singer_card.dart # Komponen kartu penyanyi untuk list view
│   └── main.dart            # Titik masuk utama aplikasi (MaterialApp & Theme)
├── test/
│   └── widget_test.dart     # Pengujian widget & verifikasi integritas data
├── pubspec.yaml             # Konfigurasi dependensi dan assets
└── README.md
```

---

## 🚀 Memulai (Getting Started)

### Prasyarat

Pastikan Anda telah menginstal perangkat berikut pada sistem Anda:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.12.0 atau lebih baru)
- Dart SDK (termasuk di dalam Flutter SDK)
- Android Studio / VS Code dengan ekstensi Flutter & Dart
- Emulator Android / Simulator iOS / Perangkat fisik dengan USB Debugging aktif

### Langkah Instalasi

1. **Clone repository ini:**
   ```bash
   git clone https://github.com/username-anda/singer-explorer.git
   cd singer-explorer
   ```

2. **Unduh dependensi Flutter:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

---

## 🧪 Pengujian (Testing)

Untuk menjalankan analisis kode dan pengujian otomatis:

```bash
# Analisis linter dan kode Dart
flutter analyze

# Menjalankan unit & widget test
flutter test
```

---

## 🛠️ Teknologi yang Digunakan

- **Framework**: [Flutter](https://flutter.dev/)
- **Bahasa**: [Dart](https://dart.dev/)
- **UI & State**: Standard Flutter Widgets & Clean State Management

---

## 📄 Lisensi

Proyek ini dibuat untuk tujuan edukasi dan portofolio. Didistribusikan di bawah lisensi [MIT](LICENSE).

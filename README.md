<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.10-blue?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.10-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Material_3-Enabled-teal?style=for-the-badge" alt="Material 3" />
</p>

<h1 align="center">Media Tracker</h1>
<p align="center">
  <i>Aplikasi untuk tracking progress film, series, buku, anime, dan game favoritmu</i>
</p>

---

## Daftar Isi

- [Daftar Isi](#daftar-isi)
- [Deskripsi](#deskripsi)
- [Fitur](#fitur)
- [Widget yang Digunakan](#widget-yang-digunakan)
- [Struktur Proyek](#struktur-proyek)
- [Cara Menjalankan](#cara-menjalankan)

---

## Deskripsi

**Media Tracker** adalah aplikasi mobile yang dibangun dengan Flutter untuk mata kuliah Pemrograman Aplikasi Bergerak (PAB). Aplikasi ini memungkinkan pengguna mencatat dan mengelola daftar media, mulai dari film, serial TV, buku, anime, hingga game, dalam satu tempat.

Dengan tampilan yang bersih dan navigasi yang intuitif, kamu bisa menambah media baru, melihat daftar yang sudah dicatat, mengubah data yang salah ketik, atau menghapus entri yang sudah tidak relevan.

---

## Fitur

<p>
  <img src="https://img.shields.io/badge/Create-Tambah_Data-22c55e?style=flat-square" alt="Create" />
  <img src="https://img.shields.io/badge/Read-Tampilkan_Data-3b82f6?style=flat-square" alt="Read" />
  <img src="https://img.shields.io/badge/Update-Edit_Data-8b5cf6?style=flat-square" alt="Update" />
  <img src="https://img.shields.io/badge/Delete-Hapus_Data-ef4444?style=flat-square" alt="Delete" />
</p>

| Fitur | Keterangan |
|-------|------------|
| Tambah media | Form input dengan 3 field (Judul, Tipe, Status) |
| Tampilkan daftar | Daftar media dalam bentuk kartu dengan ikon sesuai tipe |
| Edit media | Ketuk item untuk membuka form edit |
| Hapus media | Tombol hapus dengan dialog konfirmasi |
| Multi-page | Navigasi antar halaman daftar dan form |

<details>
<summary><b>Detail fitur per halaman</b></summary>

- **Halaman Daftar:** Menampilkan semua media dalam ListView, ikon dinamis (film, series, buku, anime, game), empty state saat belum ada data
- **Form Tambah/Edit:** Tiga TextField (Judul, Tipe, Status) dengan validasi dan ikon prefix
- **Konfirmasi Hapus:** AlertDialog sebelum data dihapus

</details>

---

## Widget yang Digunakan

<p>
  <img src="https://img.shields.io/badge/Layout-Column_Row_ListView-64748b?style=flat-square" alt="Layout" />
  <img src="https://img.shields.io/badge/Input-Form_TextFormField-64748b?style=flat-square" alt="Input" />
  <img src="https://img.shields.io/badge/Aksi-Button_IconButton_FAB-64748b?style=flat-square" alt="Aksi" />
</p>

| Kategori | Widget |
|----------|--------|
| **Struktur** | `MaterialApp`, `Scaffold`, `Form` |
| **Layout** | `Column`, `Row`, `ListView`, `ListView.builder` |
| **Kontainer** | `Container`, `Card`, `CircleAvatar` |
| **Input** | `TextFormField`, `InputDecoration` |
| **Navigasi** | `Navigator.push` / `pop`, `MaterialPageRoute` |
| **Tombol** | `ElevatedButton`, `FilledButton`, `FilledButton.icon`, `TextButton`, `IconButton`, `FloatingActionButton` |
| **Dialog** | `AlertDialog`, `showDialog` |
| **Lainnya** | `AppBar`, `ListTile`, `Text`, `Icon` |

<details>
<summary><b>Widget per file</b></summary>

**main.dart**
- `MaterialApp`, `ThemeData`, `ColorScheme`, `AppBarTheme`, `CardThemeData`, `InputDecorationTheme`, `FloatingActionButtonThemeData`

**media_list_page.dart**
- `Scaffold`, `AppBar`, `ListView.builder`, `Card`, `ListTile`, `CircleAvatar`, `Icon`, `IconButton`, `FloatingActionButton`, `AlertDialog`, `TextButton`, `FilledButton`

**media_form_page.dart**
- `Scaffold`, `AppBar`, `Form`, `ListView`, `TextFormField`, `InputDecoration`, `FilledButton.icon`, `SizedBox`

**media_item.dart** (model)
- Bukan widget; class data dengan `copyWith`, `toJson`, `fromJson`

</details>

---

## Struktur Proyek

<details>
<summary><b>Lihat struktur folder</b></summary>

```
lib/
├── main.dart              # Entry point, theme, routing
├── models/
│   └── media_item.dart    # Model data media
└── pages/
    ├── media_list_page.dart   # Halaman daftar (Read)
    └── media_form_page.dart   # Form tambah/edit (Create, Update)
```

</details>

---

## Cara Menjalankan

<details>
<summary><b>Prasyarat</b></summary>

- Flutter SDK 3.10 atau lebih baru
- Editor (VS Code / Android Studio) atau terminal

</details>

1. **Clone repository**
   ```bash
   git clone https://github.com/ariscandra/PAB-Mini_Project1.git
   cd PAB-Mini_Project1
   ```

2. **Pasang dependensi**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi**
   ```bash
   flutter run
   ```

   Jalankan di perangkat atau emulator yang sudah terhubung.

---

<p align="center">
  <sub>Mini Proyek PAB (Pemrograman Aplikasi Bergerak)</sub>
</p>

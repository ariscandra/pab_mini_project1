<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.10-blue?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.10-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/GetX-4.7-teal?style=for-the-badge" alt="GetX" />
  <img src="https://img.shields.io/badge/Material_3-Enabled-64748b?style=for-the-badge" alt="Material 3" />
</p>

<h1 align="center">Media Tracker</h1>
<p align="center">
  <i>Aplikasi untuk melacak film, series, buku, anime, dan game favoritmu</i>
</p>

---

## Daftar Isi

- [Deskripsi](#deskripsi)
- [Fitur](#fitur)
- [Parameter antar Halaman](#parameter-antar-halaman)
- [Widget yang Digunakan](#widget-yang-digunakan)
- [Struktur Proyek](#struktur-proyek)
- [Cara Menjalankan](#cara-menjalankan)

---

## Deskripsi

**Media Tracker** adalah aplikasi mobile yang dibangun dengan Flutter untuk mata kuliah Pemrograman Aplikasi Bergerak (PAB). Aplikasi ini memungkinkan pengguna mencatat dan mengelola daftar media, mulai dari film, serial TV, buku, anime, hingga game, dalam satu tempat.

Tampilan dirancang responsif untuk semua perangkat (ponsel, tablet, desktop), menggunakan font Poppins, dan dibangun dengan GetX untuk navigasi dan state management. Pengguna bisa menambah media baru, melihat daftar, mengubah data, atau menghapus entri dengan navigasi multi halaman yang lancar.

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
| Tambah media | Form dengan Judul, Tipe (TextField), Status (dropdown) |
| Tampilkan daftar | Kartu media dengan ikon dinamis sesuai tipe |
| Edit media | Ketuk item untuk membuka form dengan data terisi |
| Hapus media | Tombol hapus dengan dialog konfirmasi |
| Multi-page | Navigasi daftar ↔ form via GetX |
| Responsif | Layout menyesuaikan mobile, tablet, dan desktop |

<details>
<summary><b>Detail fitur per halaman</b></summary>

- **Halaman Daftar:** ListView reaktif (Obx), ikon sesuai tipe media, empty state, FAB tambah
- **Form Tambah/Edit:** TextField (Judul, Tipe), DropdownButtonFormField (Status: Plan To, On Going, Done), validasi, menerima parameter via constructor
- **Konfirmasi Hapus:** Get.dialog dengan AlertDialog

</details>

---

## Parameter antar Halaman

Aplikasi menerapkan pengiriman parameter dari halaman A ke halaman B lewat constructor.

**Contoh:** Saat pengguna mengetuk item di halaman daftar untuk edit, halaman daftar mengirim objek `MediaItem` ke halaman form lewat constructor:

```dart
// Halaman A (MediaListPage) mengirim parameter
Get.to(() => MediaFormPage(item: media));

// Halaman B (MediaFormPage) menerima lewat constructor
class MediaFormPage extends StatefulWidget {
  final MediaItem? item;  // item = null untuk tambah, terisi untuk edit
  const MediaFormPage({super.key, this.item});
}
```

Untuk tambah media, parameter `item` dikirim sebagai `null`. Untuk edit, `item` berisi data media yang dipilih.

---

## Widget yang Digunakan

<p>
  <img src="https://img.shields.io/badge/Layout-Column_Row_ListView-64748b?style=flat-square" alt="Layout" />
  <img src="https://img.shields.io/badge/Input-Form_Dropdown-64748b?style=flat-square" alt="Input" />
  <img src="https://img.shields.io/badge/State-GetX_Obx-64748b?style=flat-square" alt="GetX" />
</p>

| Kategori | Widget / Komponen |
|----------|-------------------|
| **Struktur** | `GetMaterialApp`, `Scaffold`, `Form`, `SafeArea` |
| **Layout** | `Column`, `Row`, `ListView`, `ListView.builder`, `ConstrainedBox`, `SingleChildScrollView` |
| **Kontainer** | `Container`, `Card`, `CircleAvatar` |
| **Input** | `TextFormField`, `DropdownButtonFormField`, `InputDecoration` |
| **Navigasi** | `Get.to`, `Get.back`, `Get.dialog` |
| **State** | `GetxController`, `Obx`, `RxList` |
| **Tombol** | `FilledButton`, `FilledButton.icon`, `TextButton`, `IconButton`, `FloatingActionButton` |
| **Dialog** | `AlertDialog`, `Get.dialog` |
| **Lainnya** | `AppBar`, `ListTile`, `Text`, `Icon` |

<details>
<summary><b>Widget per file</b></summary>

**main.dart**  
`GetMaterialApp`, `ThemeData`, `GoogleFonts.poppinsTextTheme`, `ColorScheme`, `AppBarTheme`, `CardThemeData`, `InputDecorationTheme`, `FloatingActionButtonThemeData`

**media_list_page.dart**  
`Scaffold`, `AppBar`, `Obx`, `ListView.builder`, `Card`, `ListTile`, `CircleAvatar`, `Icon`, `IconButton`, `FloatingActionButton`, `AlertDialog`, `TextButton`, `FilledButton`, `ConstrainedBox`

**media_form_page.dart**  
`Scaffold`, `AppBar`, `Form`, `TextFormField`, `DropdownButtonFormField`, `InputDecoration`, `FilledButton.icon`, `SizedBox`, `SingleChildScrollView`

**media_controller.dart**  
`GetxController`, `RxList` (bukan widget)

**media_item.dart**  
Model data dengan `copyWith`, `toJson`, `fromJson` (bukan widget)

**responsive.dart**  
Helper untuk layout responsif (bukan widget)

</details>

---

## Struktur Proyek

<details>
<summary><b>Lihat struktur folder</b></summary>

```
lib/
├── main.dart
├── constants/
│   └── status_options.dart    # Opsi dropdown status
├── controllers/
│   └── media_controller.dart  # GetX controller daftar media
├── models/
│   └── media_item.dart
├── pages/
│   ├── media_list_page.dart
│   └── media_form_page.dart
└── utils/
    └── responsive.dart        # Helper layout responsif
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
   git clone https://github.com/ariscandra/pab_mini_project1.git
   cd pab_mini_project1
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
  <sub>Mini Proyek 1 PAB (Pemrograman Aplikasi Bergerak)</sub>
</p>

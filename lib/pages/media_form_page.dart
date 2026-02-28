import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/status_options.dart';
import '../models/media_item.dart';
import '../utils/responsive.dart';

class MediaFormPage extends StatefulWidget {
  final MediaItem? item;

  const MediaFormPage({super.key, this.item});

  @override
  State<MediaFormPage> createState() => _MediaFormPageState();
}

class _MediaFormPageState extends State<MediaFormPage> {
  final _kunciForm = GlobalKey<FormState>();
  late final TextEditingController _controllerJudul;
  late final TextEditingController _controllerTipe;
  late String _statusTerpilih;

  @override
  void initState() {
    super.initState();
    final data = widget.item;
    _controllerJudul = TextEditingController(text: data?.title ?? '');
    _controllerTipe = TextEditingController(text: data?.type ?? '');
    final statusLama = data?.status ?? '';
    _statusTerpilih = daftarStatus.contains(statusLama) ? statusLama : daftarStatus.first;
  }

  @override
  void dispose() {
    _controllerJudul.dispose();
    _controllerTipe.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_kunciForm.currentState?.validate() ?? false) {
      final hasil = widget.item != null
          ? widget.item!.copyWith(
              title: _controllerJudul.text.trim(),
              type: _controllerTipe.text.trim(),
              status: _statusTerpilih,
            )
          : MediaItem(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: _controllerJudul.text.trim(),
              type: _controllerTipe.text.trim(),
              status: _statusTerpilih,
            );
      Get.back(result: hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.paddingHorizontal(context);
    final spacing = Responsive.spacing(context);
    final maxW = Responsive.maxContentWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item == null ? 'Tambah Media' : 'Edit Media',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: Form(
                key: _kunciForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _controllerJudul,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'Judul',
                        labelStyle: GoogleFonts.poppins(),
                        hintText: 'Attack on Titan, Inception',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        prefixIcon: const Icon(Icons.title_rounded),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Judul wajib diisi' : null,
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _controllerTipe,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'Tipe',
                        labelStyle: GoogleFonts.poppins(),
                        hintText: 'Film, Series, Buku, Anime, Game',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        prefixIcon: const Icon(Icons.category_rounded),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Tipe wajib diisi' : null,
                    ),
                    SizedBox(height: spacing),
                    DropdownButtonFormField<String>(
                      // ignore: deprecated_member_use
                      value: _statusTerpilih,
                      decoration: InputDecoration(
                        labelText: 'Status',
                        labelStyle: GoogleFonts.poppins(),
                        prefixIcon: const Icon(Icons.playlist_play_rounded),
                      ),
                      style: GoogleFonts.poppins(),
                      borderRadius: BorderRadius.circular(12),
                      items: daftarStatus
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s, style: GoogleFonts.poppins()),
                              ))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) setState(() => _statusTerpilih = v);
                      },
                      validator: (v) => (v == null || v.isEmpty) ? 'Pilih status' : null,
                    ),
                    SizedBox(height: spacing + 12),
                    FilledButton.icon(
                      onPressed: _simpan,
                      icon: const Icon(Icons.check_rounded),
                      label: Text('Simpan', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 14 : 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

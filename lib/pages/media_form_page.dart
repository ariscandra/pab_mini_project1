import 'package:flutter/material.dart';
import '../models/media_item.dart';

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
  late final TextEditingController _controllerStatus;

  @override
  void initState() {
    super.initState();
    final data = widget.item;
    _controllerJudul = TextEditingController(text: data?.title ?? '');
    _controllerTipe = TextEditingController(text: data?.type ?? '');
    _controllerStatus = TextEditingController(text: data?.status ?? '');
  }

  @override
  void dispose() {
    _controllerJudul.dispose();
    _controllerTipe.dispose();
    _controllerStatus.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_kunciForm.currentState?.validate() ?? false) {
      final hasil = widget.item != null
          ? widget.item!.copyWith(
              title: _controllerJudul.text.trim(),
              type: _controllerTipe.text.trim(),
              status: _controllerStatus.text.trim(),
            )
          : MediaItem(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: _controllerJudul.text.trim(),
              type: _controllerTipe.text.trim(),
              status: _controllerStatus.text.trim(),
            );
      Navigator.pop(context, hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Tambah Media' : 'Edit Media'),
      ),
      body: Form(
        key: _kunciForm,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _controllerJudul,
              decoration: const InputDecoration(
                labelText: 'Judul',
                hintText: 'Attack on Titan, Inception',
                prefixIcon: Icon(Icons.title_rounded),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Judul wajib diisi' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controllerTipe,
              decoration: const InputDecoration(
                labelText: 'Tipe',
                hintText: 'Film, Series, Buku, Anime, Game',
                prefixIcon: Icon(Icons.category_rounded),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Tipe wajib diisi' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controllerStatus,
              decoration: const InputDecoration(
                labelText: 'Status',
                hintText: 'Mau, Lagi proses, Udah kelar',
                prefixIcon: Icon(Icons.playlist_play_rounded),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Status wajib diisi' : null,
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: _simpan,
              icon: const Icon(Icons.check_rounded),
              label: const Text('Simpan'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_form_page.dart';

class MediaListPage extends StatefulWidget {
  const MediaListPage({super.key});

  @override
  State<MediaListPage> createState() => _MediaListPageState();
}

class _MediaListPageState extends State<MediaListPage> {
  final List<MediaItem> _daftarMedia = [];

  Future<void> _konfirmasiHapus(MediaItem media) async {
    final ya = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus media?'),
        content: Text('"${media.title}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (ya == true && mounted) {
      setState(() => _daftarMedia.removeWhere((m) => m.id == media.id));
    }
  }

  Future<void> _bukaFormTambah() async {
    final hasil = await Navigator.push<MediaItem>(
      context,
      MaterialPageRoute(builder: (context) => const MediaFormPage()),
    );
    if (hasil != null && mounted) {
      setState(() => _daftarMedia.add(hasil));
    }
  }

  Future<void> _bukaFormUbah(MediaItem media) async {
    final hasil = await Navigator.push<MediaItem>(
      context,
      MaterialPageRoute(builder: (context) => MediaFormPage(item: media)),
    );
    if (hasil != null && mounted) {
      setState(() {
        final idx = _daftarMedia.indexWhere((m) => m.id == hasil.id);
        if (idx >= 0) _daftarMedia[idx] = hasil;
      });
    }
  }

  IconData _ikonUntukTipe(String tipe) {
    final t = tipe.toLowerCase();
    if (t.contains('film') || t.contains('movie')) return Icons.movie_rounded;
    if (t.contains('series') || t.contains('show')) return Icons.live_tv_rounded;
    if (t.contains('buku') || t.contains('book')) return Icons.menu_book_rounded;
    if (t.contains('anime')) return Icons.auto_awesome_rounded;
    if (t.contains('game')) return Icons.sports_esports_rounded;
    return Icons.video_library_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Tracker'),
      ),
      body: _daftarMedia.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.queue_play_next_rounded, size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada media',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tekan tombol + untuk menambah',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              itemCount: _daftarMedia.length,
              itemBuilder: (context, index) {
                final media = _daftarMedia[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(_ikonUntukTipe(media.type), color: Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                    title: Text(
                      media.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${media.type} · ${media.status}'),
                    isThreeLine: false,
                    onTap: () => _bukaFormUbah(media),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline_rounded),
                      onPressed: () => _konfirmasiHapus(media),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaFormTambah,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

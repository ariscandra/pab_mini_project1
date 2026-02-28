import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/media_controller.dart';
import '../models/media_item.dart';
import '../utils/responsive.dart';
import 'media_form_page.dart';

class MediaListPage extends StatelessWidget {
  const MediaListPage({super.key});

  void _konfirmasiHapus(MediaItem media) {
    Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Hapus media?', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        content: Text(
          '"${media.title}" akan dihapus dari daftar.',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('Batal', style: GoogleFonts.poppins()),
          ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            child: Text('Hapus', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ).then((ya) {
      if (ya == true) Get.find<MediaController>().hapus(media);
    });
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
    final ctrl = Get.find<MediaController>();
    final padding = Responsive.paddingHorizontal(context);
    final maxW = Responsive.maxContentWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Tracker'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxW),
            child: Obx(
              () {
                if (ctrl.daftarMedia.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.queue_play_next_rounded,
                          size: Responsive.isMobile(context) ? 72 : 88,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: Responsive.spacing(context)),
                        Text(
                          'Belum ada media',
                          style: GoogleFonts.poppins(
                            fontSize: Responsive.fontSizeJudul(context),
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tekan tombol + untuk menambah',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(padding, 12, padding, 100),
                  itemCount: ctrl.daftarMedia.length,
                  itemBuilder: (context, index) {
                    final media = ctrl.daftarMedia[index];
                    return Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: padding,
                          vertical: Responsive.isMobile(context) ? 8 : 12,
                        ),
                        leading: CircleAvatar(
                          radius: Responsive.isMobile(context) ? 22 : 26,
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Icon(
                            _ikonUntukTipe(media.type),
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            size: Responsive.isMobile(context) ? 24 : 28,
                          ),
                        ),
                        title: Text(
                          media.title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.isMobile(context) ? 15 : 16,
                          ),
                        ),
                        subtitle: Text(
                          '${media.type} · ${media.status}',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        onTap: () async {
                          final hasil = await Get.to<MediaItem>(() => MediaFormPage(item: media));
                          if (hasil != null) ctrl.ubah(hasil);
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline_rounded),
                          onPressed: () => _konfirmasiHapus(media),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Get.to<MediaItem>(() => const MediaFormPage());
          if (hasil != null) ctrl.tambah(hasil);
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

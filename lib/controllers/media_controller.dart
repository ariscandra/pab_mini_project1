import 'package:get/get.dart';
import '../models/media_item.dart';

class MediaController extends GetxController {
  final RxList<MediaItem> daftarMedia = <MediaItem>[].obs;

  void tambah(MediaItem item) => daftarMedia.add(item);

  void ubah(MediaItem item) {
    final idx = daftarMedia.indexWhere((m) => m.id == item.id);
    if (idx >= 0) daftarMedia[idx] = item;
  }

  void hapus(MediaItem item) => daftarMedia.removeWhere((m) => m.id == item.id);
}

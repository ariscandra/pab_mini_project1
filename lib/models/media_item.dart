class MediaItem {
  final String id;
  final String title;
  final String type;
  final String status;

  const MediaItem({
    required this.id,
    required this.title,
    required this.type,
    required this.status,
  });

  MediaItem copyWith({
    String? id,
    String? title,
    String? type,
    String? status,
  }) {
    return MediaItem(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'status': status,
      };

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        id: json['id'] as String,
        title: json['title'] as String,
        type: json['type'] as String,
        status: json['status'] as String,
      );
}

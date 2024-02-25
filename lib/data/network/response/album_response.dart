class AlbumResponse {
  final int? userId;
  final int? id;
  final String? title;

  AlbumResponse({required this.userId, required this.id, required this.title});

  factory AlbumResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int? userId,
        'id': int? id,
        'title': String? title,
      } =>
        AlbumResponse(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

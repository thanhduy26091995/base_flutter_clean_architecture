class EndPoint {
  static const String getAlbumList = "/albums";
  static const String getAlbumDetail = "/albums/{albumId}";

  static String formattedUrl(String endPoint, {Map<String, String>? params}) {
    String formated = endPoint;
    if (params != null) {
      params.forEach((key, value) {
        formated = formated.replaceAll("{$key}", value);
      });
    }
    return formated;
  }
}

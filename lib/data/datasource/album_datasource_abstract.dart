import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';

abstract interface class IAlbumDataSource {
  Future<List<AlbumResponse>> getAlbumList();
  Future<AlbumResponse> getAlbumDetail(int albumId);
}
import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';

abstract interface class IAlbumRepository {
  Future<List<AlbumDTO>> getAlbumList();
}

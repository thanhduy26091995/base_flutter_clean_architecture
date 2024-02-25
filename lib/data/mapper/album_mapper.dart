import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';
import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';

class AlbumMapper {
  static AlbumDTO toAlbumDTO({required AlbumResponse response}) {
    return AlbumDTO(
        userId: response.userId ?? 0,
        id: response.id ?? 0,
        title: response.title ?? "");
  }
}

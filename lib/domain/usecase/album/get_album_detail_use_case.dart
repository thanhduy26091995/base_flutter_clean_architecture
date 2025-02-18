import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';
import 'package:base_flutter_clean_architecture/domain/repository/album_repository_abstract.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/base_usecase.dart';

class GetAlbumDetailUseCase extends ParamUseCase<AlbumDTO, int> {
  final IAlbumRepository albumRepository;

  GetAlbumDetailUseCase(this.albumRepository);

  @override
  Future<AlbumDTO> execute(int params) {
    return albumRepository.getAlbumDetail(params);
  }
}

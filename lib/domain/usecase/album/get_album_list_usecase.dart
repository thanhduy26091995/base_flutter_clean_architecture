import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';
import 'package:base_flutter_clean_architecture/domain/repository/album_repository_abstract.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/base_usecase.dart';

class GetAlbumListUseCase extends NoParamUseCase<List<AlbumDTO>> {
  final IAlbumRepository albumRepository;

  GetAlbumListUseCase(this.albumRepository);

  @override
  Future<List<AlbumDTO>> execute() async {
    return albumRepository.getAlbumList();
  }
}

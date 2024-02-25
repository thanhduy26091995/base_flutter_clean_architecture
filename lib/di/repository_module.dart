import 'package:base_flutter_clean_architecture/data/repository/album_repository.dart';
import 'package:base_flutter_clean_architecture/di/datasource_module.dart';

mixin RepositoryModule on DataSourceModule {
  AlbumRepository get albumRepository {
    return AlbumRepository(albumDataSource);
  }
}

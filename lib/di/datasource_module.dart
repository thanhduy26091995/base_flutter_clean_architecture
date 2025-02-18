import 'package:base_flutter_clean_architecture/data/datasource/album_datasource.dart';
import 'package:base_flutter_clean_architecture/di/client_module.dart';
import 'package:base_flutter_clean_architecture/di/transformer_module.dart';

mixin DataSourceModule on ClientModule, TransformerModule {
  AlbumDataSource get albumDataSource {
    return AlbumDataSource(apiClient);
  }
}

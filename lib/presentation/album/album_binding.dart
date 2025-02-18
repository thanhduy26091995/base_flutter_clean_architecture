 import 'package:base_flutter_clean_architecture/di/client_module.dart';
import 'package:base_flutter_clean_architecture/di/datasource_module.dart';
import 'package:base_flutter_clean_architecture/di/repository_module.dart';
import 'package:base_flutter_clean_architecture/di/session_provider_module.dart';
import 'package:base_flutter_clean_architecture/di/transformer_module.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/album/get_album_list_usecase.dart';
import 'package:base_flutter_clean_architecture/presentation/album/album_controller.dart';
import 'package:get/get.dart';

class AlbumBinding extends Bindings
    with
        TransformerModule,
        DefaultSessionProviderModule,
        ClientModule,
        DataSourceModule,
        RepositoryModule {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumController(
        getAlbumListUseCase: GetAlbumListUseCase(albumRepository)));
  }
}

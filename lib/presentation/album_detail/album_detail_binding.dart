import 'package:base_flutter_clean_architecture/di/client_module.dart';
import 'package:base_flutter_clean_architecture/di/datasource_module.dart';
import 'package:base_flutter_clean_architecture/di/repository_module.dart';
import 'package:base_flutter_clean_architecture/di/session_provider_module.dart';
import 'package:base_flutter_clean_architecture/di/transformer_module.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/album/get_album_detail_use_case.dart';
import 'package:base_flutter_clean_architecture/presentation/album_detail/album_detail_controller.dart';
import 'package:get/get.dart';

class AlbumDetailBinding extends Bindings
    with
        TransformerModule,
        DefaultSessionProviderModule,
        ClientModule,
        DataSourceModule,
        RepositoryModule {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumDetailController(
        getAlbumDetailUseCase: GetAlbumDetailUseCase(albumRepository)));
  }
}

import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/album/get_album_detail_use_case.dart';
import 'package:get/get.dart';

class AlbumDetailController extends GetxController {
  final GetAlbumDetailUseCase getAlbumDetailUseCase;
  late int albumId;

  AlbumDetailController({required this.getAlbumDetailUseCase});

  var albumDetail = Rxn<AlbumDTO>();

  @override
  void onInit() {
    super.onInit();
    albumId = Get.arguments["albumId"];
    getAlbumDetail(albumId);
  }

  Future<void> getAlbumDetail(int albumId) async {
    albumDetail.value = await getAlbumDetailUseCase.execute(albumId);
  }
}

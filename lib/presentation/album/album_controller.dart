import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';
import 'package:base_flutter_clean_architecture/domain/usecase/album/get_album_list_usecase.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  final GetAlbumListUseCase getAlbumListUseCase;

  AlbumController({required this.getAlbumListUseCase});

  // Album list
  var albumList = RxList<AlbumDTO>([]);

  Future<void> fetchAlbumList() async {
    albumList.value = await getAlbumListUseCase.execute();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAlbumList();
  }
}

import 'package:base_flutter_clean_architecture/app/config/app_route.dart';
import 'package:base_flutter_clean_architecture/presentation/album/album_binding.dart';
import 'package:base_flutter_clean_architecture/presentation/album/album_page.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoute.home,
      binding: AlbumBinding(),
      page: () => const AlbumPage(),
    )
  ];
}

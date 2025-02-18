import 'package:base_flutter_clean_architecture/app/config/app_route.dart';
import 'package:base_flutter_clean_architecture/app/config/app_text.dart';
import 'package:base_flutter_clean_architecture/domain/entity/album_dto.dart';
import 'package:base_flutter_clean_architecture/presentation/album/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumPage extends GetView<AlbumController> {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: AppText.primaryButton("Album List"),
            centerTitle: true,
            elevation: 2,
          ),
          body: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: controller.albumList.length,
                itemBuilder: (context, index) {
                  return _albumItem(controller.albumList[index], (album) {
                    // Navigate to Album detail
                    Get.toNamed(AppRoute.albumDetail,
                        arguments: {"albumId": album.id});
                  });
                }),
          ),
        ));
  }

  Widget _albumItem(AlbumDTO albumDTO, Function(AlbumDTO) onAlbumClicked) {
    return InkWell(
      onTap: () => onAlbumClicked(albumDTO),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.primary("UserId: ${albumDTO.userId}"),
              AppText.primary("Id: ${albumDTO.id}"),
              AppText.primaryButton("Title: ${albumDTO.title}"),
            ],
          ),
        ),
      ),
    );
  }
}

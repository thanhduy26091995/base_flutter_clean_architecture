import 'package:base_flutter_clean_architecture/presentation/album_detail/album_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumDetailPage extends GetView<AlbumDetailController> {
  const AlbumDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: const Text("Album Detail")),
          body: Center(
            child: controller.albumDetail.value == null
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Album ID: ${controller.albumDetail.value!.id}"),
                      Text(
                          "Album title: ${controller.albumDetail.value!.title}"),
                    ],
                  ),
          ),
        ));
  }
}

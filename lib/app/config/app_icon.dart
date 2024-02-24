import 'package:base_flutter_clean_architecture/app/config/app_image.dart';
import 'package:flutter/material.dart';

abstract class AppIcon {
  AppIcon._();

  static const String _assetPath = "assets/icons";

  static AppIconBuilder get icArrowDown =>
      AppIconBuilder(assetPath: "$_assetPath/ic_arrow_down.svg");
}

class AppIconBuilder {
  final String assetPath;

  AppIconBuilder({required this.assetPath});

  Widget widget({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BorderRadius? borderRadius,
    Widget? placeHolder,
    String? errorImageUrl,
    int? memCacheHeight,
  }) {
    return ImageBuilder(
      key: key,
      input: assetPath,
      alignment: alignment,
      borderRadius: borderRadius,
      boxFit: fit,
      color: color,
      errorImageUrl: errorImageUrl,
      height: height,
      width: width,
      memCacheHeight: memCacheHeight,
      placeHolder: placeHolder,
    );
  }
}

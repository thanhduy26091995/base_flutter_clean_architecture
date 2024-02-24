import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppImage {
  AppImage._();
  static const String assetPath = "assets/images";

  static AppImageBuilder get imageCover =>
      AppImageBuilder(assetPath: "$assetPath/cover.png");
}

class AppImageBuilder {
  final String assetPath;

  AppImageBuilder({required this.assetPath});

  Widget widget({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BorderRadius? borderRadius,
    Widget? placeholder,
    String? errorImageUrl,
    int? memCacheHeight,
  }) {
    return ImageBuilder(
      key: key,
      input: assetPath,
      width: width,
      height: height,
      alignment: alignment,
      borderRadius: borderRadius,
      boxFit: fit,
      color: color,
      errorImageUrl: errorImageUrl,
      memCacheHeight: memCacheHeight,
      placeHolder: placeholder,
    );
  }
}

class ImageBuilder extends StatelessWidget {
  final dynamic input;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  final Widget? placeHolder;

  final String? errorImageUrl;
  final int? memCacheHeight;

  const ImageBuilder(
      {super.key,
      this.input,
      this.height,
      this.width,
      this.boxFit,
      this.color,
      this.borderRadius,
      this.alignment = Alignment.center,
      this.placeHolder,
      this.errorImageUrl,
      this.memCacheHeight});

  @override
  Widget build(BuildContext context) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: _image(),
      );
    }
    return _image();
  }

  Widget _placeHolder() {
    return placeHolder ??
        Container(
          color: Colors.white,
        );
  }

  Widget _image() {
    try {
      if (input?.isEmpty ?? true) {
        return _placeHolder();
      }
      // Memory cache image
      if (input is Uint8List) {
        return Image.memory(input as Uint8List,
            height: height,
            color: color,
            width: width,
            fit: boxFit,
            alignment: alignment);
      }
      if (input is! String) {
        return Container();
      }
      bool isNetworkMedia = input.startsWith("http");
      // Vector image
      if (input.endsWith('svg')) {
        if (isNetworkMedia) {
          return SvgPicture.network(input,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              height: height,
              width: width,
              fit: boxFit ?? BoxFit.contain,
              alignment: alignment);
        }
        return SvgPicture.asset(input,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            height: height,
            width: width,
            fit: boxFit ?? BoxFit.contain,
            alignment: alignment);
      }

      // Network image
      if (isNetworkMedia) {
        return SizedBox(
          width: width,
          height: height,
          child: Image.network(
            input,
            fit: BoxFit.cover,
          ),
        );
      }

      // Asset image
      return Image(
        image: AssetImage(input),
        height: height,
        color: color,
        width: width,
        fit: boxFit,
        alignment: alignment,
      );
    } catch (_) {
      return Container();
    }
  }
}

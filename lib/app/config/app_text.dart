import 'package:base_flutter_clean_architecture/app/config/app_color.dart';
import 'package:flutter/material.dart';

enum FontFamilyType {
  openSans;
}

extension FontFamilyTypeExtension on FontFamilyType {
  String? name() {
    switch (this) {
      case FontFamilyType.openSans:
        return "OpenSans";
    }
  }
}

enum FontWeightType {
  light,
  regular,
  medium,
  semiBold,
  bold;
}

extension FontWeightTypeExtension on FontWeightType {
  FontWeight type() {
    switch (this) {
      case FontWeightType.light:
        return FontWeight.w300;
      case FontWeightType.regular:
        return FontWeight.w400;
      case FontWeightType.medium:
        return FontWeight.w500;
      case FontWeightType.semiBold:
        return FontWeight.w600;
      case FontWeightType.bold:
        return FontWeight.w700;
    }
  }
}

class AppText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool scalable;
  final String? configKey;

  const AppText(
      {super.key,
      this.textStyle,
      required this.text,
      this.textAlign,
      this.textOverflow,
      this.maxLines,
      this.scalable = true,
      this.configKey});

  factory AppText.primary(String text,
      {Color? color = AppColor.black333,
      FontWeightType? fontWeight = FontWeightType.regular,
      bool scalable = true,
      String? configKey,
      TextAlign? textAlign,
      int? maxLines,
      double? fontSize = 15.0,
      TextOverflow? textOverflow,
      FontFamilyType fontFamilyType = FontFamilyType.openSans,
      TextDecoration decoration = TextDecoration.none}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
          fontWeight: fontWeight?.type(),
          fontFamily: fontFamilyType.name(),
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          overflow: textOverflow),
      scalable: scalable,
      configKey: configKey,
      maxLines: maxLines,
      textAlign: textAlign,
      textOverflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  factory AppText.primaryButton(String text,
      {Color? color = AppColor.black454,
      FontWeightType? fontWeight = FontWeightType.semiBold,
      bool scalable = true,
      String? configKey,
      TextAlign? textAlign,
      int? maxLines,
      double? fontSize = 14.0,
      TextOverflow? textOverflow,
      FontFamilyType fontFamilyType = FontFamilyType.openSans,
      TextDecoration decoration = TextDecoration.none}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
          fontWeight: fontWeight?.type(),
          fontFamily: fontFamilyType.name(),
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          overflow: textOverflow),
      scalable: scalable,
      configKey: configKey,
      maxLines: maxLines,
      textAlign: textAlign,
      textOverflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      textScaler: scalable ? const TextScaler.linear(1) : TextScaler.noScaling,
    );
  }
}

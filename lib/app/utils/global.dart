import 'package:base_flutter_clean_architecture/app/config/app_text.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  primarySwatch: MaterialColor(0xffFFFFFF, color),
  useMaterial3: false,
  fontFamily: FontFamilyType.openSans.name(),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: Color(0xff428BCA)),
);

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, .1),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 255, 255, 1),
};

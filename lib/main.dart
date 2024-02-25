import 'package:base_flutter_clean_architecture/app/config/app_page.dart';
import 'package:base_flutter_clean_architecture/app/config/app_route.dart';
import 'package:base_flutter_clean_architecture/app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp(
    route: AppRoute.home,
  ));
}

class MainApp extends StatelessWidget {
  final String route;

  const MainApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: route,
      getPages: AppPage.pages,
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
    );
  }
}

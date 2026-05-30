import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/app/binding/app_binding.dart';
import 'package:quran_mobile_app/app/routes/app_pages.dart';
import 'package:quran_mobile_app/shared/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        initialBinding: AppBinding(),

        getPages: AppPages.routes,

        initialRoute: AppRoutes.HOME,

        theme: AppTheme.theme,
      ),
    );
  }
}

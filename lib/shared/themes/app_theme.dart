import 'package:flutter/material.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,

      scrolledUnderElevation: 0,

      backgroundColor: AppColor.softWhite,
      surfaceTintColor: Colors.transparent,
    ),

    scaffoldBackgroundColor: AppColor.softWhite,
  );
}

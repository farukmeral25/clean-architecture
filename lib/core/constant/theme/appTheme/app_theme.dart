import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: AppColor.white,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.grey,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColor.black,
  );
}

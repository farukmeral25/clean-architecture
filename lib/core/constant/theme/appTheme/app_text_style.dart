// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';

class AppTextStyle {
  static TextStyle headTitleStyle = TextStyle(
    color: AppColor.black,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTitleStyle = TextStyle(
    color: AppColor.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle body12w500 = TextStyle(
    color: AppColor.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body14w700 = TextStyle(
    color: AppColor.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle filterTextStyle = TextStyle(
    color: AppColor.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

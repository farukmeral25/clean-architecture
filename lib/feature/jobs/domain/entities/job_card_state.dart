// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';

enum JobCardState { OPENED, DELIVERED, CANCELLED }

extension JobCardStateExtension on JobCardState {
  Color stateToColor() {
    switch (this) {
      case JobCardState.OPENED:
        return AppColor.haki;
      case JobCardState.DELIVERED:
        return AppColor.black;
      case JobCardState.CANCELLED:
        return AppColor.blue;
    }
  }

  String stateToText() {
    switch (this) {
      case JobCardState.OPENED:
        return "Opened";
      case JobCardState.DELIVERED:
        return "Delivered";
      case JobCardState.CANCELLED:
        return "Cancelled";
    }
  }
}

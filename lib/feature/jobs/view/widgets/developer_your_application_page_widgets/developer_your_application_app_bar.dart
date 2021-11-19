// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';

class DeveloperYourApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DeveloperYourApplicationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.skin,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0);
}

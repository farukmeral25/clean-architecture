// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';

class DeveloperJobsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DeveloperJobsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.skin,
      elevation: 0,
      leading: leading(),
      actions: actions(),
    );
  }

  Icon leading() {
    return Icon(
      Icons.menu_open_rounded,
      color: AppColor.black,
    );
  }

  List<Widget> actions() {
    return [
      Icon(
        Icons.search,
        color: AppColor.black,
      ),
      SizedBox(
        width: 30,
      ),
      Icon(
        Icons.menu,
        color: AppColor.black,
      ),
      SizedBox(
        width: 15,
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

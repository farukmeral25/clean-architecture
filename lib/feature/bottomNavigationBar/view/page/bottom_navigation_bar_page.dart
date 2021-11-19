// ignore_for_file: prefer_const_constructors,, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/feature/bottomNavigationBar/view/widgets/bottom_navigation_bar.dart';
import 'package:flutter_clean_architecture/feature/bottomNavigationBar/viewmodel/bottom_navigation_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (BuildContext context, BottomNavigationBarProvider bottomNavigationBarProvider, Widget? widget) {
        return Scaffold(
          appBar: bottomNavigationBarProvider.appbars[bottomNavigationBarProvider.currentIndex],
          body: bottomNavigationBarProvider.bodies[bottomNavigationBarProvider.currentIndex],
          backgroundColor: AppColor.skin,
          bottomNavigationBar: BottomNavigationBarWidget(),
        );
      },
    );
  }
}

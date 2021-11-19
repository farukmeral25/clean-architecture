// ignore_for_file: prefer_const_constructors,, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
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
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              color: AppColor.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomNavigationBarProvider.currentIndex = 0;
                        bottomNavigationBarProvider.visible = true;
                      },
                      child: Container(
                        height: 75,
                        width: (MediaQuery.of(context).size.width - 50) / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Jobs',
                              style: AppTextStyle.body14w700.copyWith(
                                color: bottomNavigationBarProvider.visible ? AppColor.black : AppColor.grey,
                              ),
                            ),
                            Visibility(
                              visible: bottomNavigationBarProvider.visible,
                              child: CircleAvatar(
                                backgroundColor: AppColor.black,
                                radius: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomNavigationBarProvider.currentIndex = 1;
                        bottomNavigationBarProvider.visible = false;
                      },
                      child: Container(
                        height: 75,
                        width: (MediaQuery.of(context).size.width - 50) / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Applications',
                              style: AppTextStyle.body14w700.copyWith(
                                color: !bottomNavigationBarProvider.visible ? AppColor.black : AppColor.grey,
                              ),
                            ),
                            Visibility(
                              visible: !bottomNavigationBarProvider.visible,
                              child: CircleAvatar(
                                backgroundColor: AppColor.black,
                                radius: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

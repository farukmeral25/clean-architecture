import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';
import 'package:flutter_clean_architecture/core/base/view/base_view.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/core/constant/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends BaseState<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onPageBuilder: (context, value) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Clean Architecture",
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (BuildContext context, ThemeProvider themeProvider, Widget? widget) {
              return Switch(
                activeColor: AppColor.haki,
                inactiveTrackColor: AppColor.black,
                inactiveThumbColor: AppColor.grey,
                value: themeProvider.themeData,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';

import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/core/constant/theme/theme_provider.dart';
import 'package:flutter_clean_architecture/core/init/injection_container.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/viewmodel/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../features.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends BaseState<HomeBody> {
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
          GestureDetector(
            onTap: () {
              serviceLocator<LoginProvider>().removeUserInfo();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
                ModalRoute.withName('/loginPage'),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              color: AppColor.grey,
              child: const Center(child: Text('Çıkış Yap')),
            ),
          ),
        ],
      ),
    );
  }
}

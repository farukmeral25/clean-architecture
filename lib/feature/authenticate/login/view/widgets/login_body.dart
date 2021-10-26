// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';

import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/core/function/validator.dart';
import 'package:flutter_clean_architecture/core/init/injection_container.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/viewmodel/login_provider.dart';
import 'package:flutter_clean_architecture/feature/features.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends BaseState<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onPageBuilder: (context, value) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<LoginProvider>(
                  builder: (BuildContext context, LoginProvider loginProvider, Widget? widget) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: loginProvider.textEditingControllerEmail,
                          decoration: const InputDecoration(
                            hintText: 'E-Mail',
                          ),
                          validator: (mail) {
                            if (emailValidator(mail!)) {
                              return 'Email hatalı';
                            }
                          },
                        ),
                        TextFormField(
                          controller: loginProvider.textEditingControllerPassword,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (password) {
                            if (!passwordValidator(password!)) {
                              return 'Şifre hatalı';
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    serviceLocator<LoginProvider>().cacheUserInfo();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                    );
                  }
                },
                child: Container(
                  height: dynamicHeight(.05),
                  width: dynamicWidth(.8),
                  child: const Center(child: Text('Giriş Yap')),
                  decoration: BoxDecoration(
                    color: AppColor.haki,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

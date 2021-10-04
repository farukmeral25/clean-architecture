import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';
import 'package:flutter_clean_architecture/core/base/view/base_view.dart';

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
      onPageBuilder: (context, value) => const Text("Clean Architecture"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(),
      body: LoginBody(),
    );
  }
}

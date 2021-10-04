import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Clean Architecture"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

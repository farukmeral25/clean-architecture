import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/route.dart';
import 'package:flutter_clean_architecture/feature/features.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    case HomePageRoute:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}

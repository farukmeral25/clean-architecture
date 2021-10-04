import 'package:flutter/material.dart';
import 'feature/authenticate/login/login.dart';

void main() {
  runApp(const CleanArchitectureApp());
}

class CleanArchitectureApp extends StatelessWidget {
  const CleanArchitectureApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

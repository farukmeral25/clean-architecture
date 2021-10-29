import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/init/injection_container.dart';
import 'package:flutter_clean_architecture/feature/authenticate/authenticate.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/viewmodel/login_provider.dart';
import 'package:flutter_clean_architecture/feature/home/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginProvider>(
          builder: (BuildContext context, LoginProvider loginProvider, Widget? widget) {
            return GestureDetector(
                onTap: () {
                  if (loginProvider.userInfo.email == '' || loginProvider.userInfo.password == '') {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
                      ModalRoute.withName('/loginPage'),
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                      ModalRoute.withName('/homePage'),
                    );
                  }
                },
                child:
                    Container(height: 200, width: 200, color: Colors.red, child: const Center(child: Text('giriş'))));
          },
        ),
      ),
    );
  }
}

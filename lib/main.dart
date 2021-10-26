import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_theme.dart';
import 'package:flutter_clean_architecture/core/constant/theme/theme_provider.dart';
import 'package:flutter_clean_architecture/core/utils/router.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/viewmodel/login_provider.dart';
import 'package:flutter_clean_architecture/feature/authenticate/splash/splash.dart';
import 'package:provider/provider.dart';
import 'core/init/injection_container.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => dependencyInjection.serviceLocator(),
        ),
      ],
      child: const CleanArchitectureApp(),
    ),
  );
}

class CleanArchitectureApp extends StatelessWidget {
  const CleanArchitectureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, Widget? widget) {
        return MaterialApp(
          title: 'Flutter Clean Architecture',
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          onGenerateRoute: generateRoute,
          darkTheme: AppTheme.darkTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}

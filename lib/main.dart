import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_theme.dart';
import 'package:flutter_clean_architecture/core/constant/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'feature/authenticate/login/login.dart';
import 'core/init/injection_container.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())],
      child: const CleanArchitectureApp(),
    ),
  );
}

class CleanArchitectureApp extends StatelessWidget {
  const CleanArchitectureApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, Widget? widget) {
        return MaterialApp(
          title: 'Flutter Clean Architecture',
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}

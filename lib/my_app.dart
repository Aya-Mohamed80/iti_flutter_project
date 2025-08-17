import 'package:flutter/material.dart';
import 'package:iti_project/core/theme/app_theme.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  final ThemeData themeData;
  const MyApp({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, 
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

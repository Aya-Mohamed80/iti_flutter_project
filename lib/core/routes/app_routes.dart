import 'package:iti_project/features/auth/signup/screen/signup_screen.dart';
import 'package:iti_project/features/auth/login/screen/login_screen.dart';
import 'package:iti_project/features/home/screen/home_screen.dart';
import 'package:iti_project/features/screens/profile_screen.dart';
import 'package:iti_project/features/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String profile = '/profile';
  static const String notfound = 'Page not found';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text(notfound))),
        );
    }
  }
}

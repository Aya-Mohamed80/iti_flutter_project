import 'package:flutter/material.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/utiles/app_colors.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/widgets/app_widgets.dart';

class SplashScreen extends StatelessWidget {
 const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      body: SafeArea(
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.shopping_bag,
                  size: 120,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "  ${AppStrings.welcome}  ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 50),
              defaultButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                text: AppStrings.letsGo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

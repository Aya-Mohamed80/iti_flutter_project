import 'package:iti_project/core/widgets/app_widgets.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/theme/theme_event.dart';
import 'package:iti_project/core/theme/theme_state.dart';
import 'package:iti_project/core/theme/theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppHeader(
        title: AppStrings.profile,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            CircleAvatar(
              radius: 100,
              backgroundImage :
                  NetworkImage(
                       'https://i.ibb.co/8456YJth/istockphoto-1300845620-612x612.jpg',
                      ),
            ),
            const SizedBox(height: 40),
            Text(
              user?.email ?? AppStrings.noemail,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

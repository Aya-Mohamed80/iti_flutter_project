import 'package:iti_project/features/auth/signup/bloc/signup_bloc.dart';
import 'package:iti_project/features/auth/signup/repo/signup_repo.dart';
import 'package:iti_project/features/auth/login/bloc/login_bloc.dart';
import 'package:iti_project/features/auth/login/repo/login_repo.dart';
import 'package:iti_project/features/home/bloc/home_bloc.dart';
import 'package:iti_project/features/home/repo/home_repo.dart';
import 'package:iti_project/core/theme/theme_state.dart';
import 'package:iti_project/core/theme/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppWithBlocProviders());
}

class AppWithBlocProviders extends StatelessWidget {
  const AppWithBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>( create: (_) => LoginBloc(loginRepo: LoginRepo())),
        BlocProvider<SignupBloc>( create: (_) => SignupBloc(signupRepo: SignupRepo())),
        BlocProvider<HomeBloc>( create: (_) => HomeBloc(homeRepo: HomeRepo())),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MyApp(themeData: state.themeData);
        },
      ),
    );
  }
}

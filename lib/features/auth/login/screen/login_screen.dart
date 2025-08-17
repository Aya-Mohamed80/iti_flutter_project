import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import '../../../../core/widgets/app_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../signup/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
        LoginSubmitted( // event
          _emailController.text.trim(),
          _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: AppStrings.login),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false, // يمسح كل الصفحات القديمة
              );
            }
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },

          builder: (context, state) {
            return Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  defaultTextFormField(
                    controller: _emailController,
                    hint: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enteremail;
                      }
                      if (!RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return AppStrings.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  defaultTextFormField(
                    controller: _passwordController,
                    hint: AppStrings.password,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enterpassword;
                      }
                      if (value.length < 6) {
                        return AppStrings.passwordMin;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : defaultButton(
                        onPressed: _onLoginPressed,
                        text: AppStrings.login,
                      ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: const Text(AppStrings.dontHA),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

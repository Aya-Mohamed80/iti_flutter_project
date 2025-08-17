import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import '../../../../core/widgets/app_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignupPressed() { // for Validation
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignupBloc>().add(
        SignupSubmitted(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: AppStrings.signup),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.signupSuccess)),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
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
                        onPressed: _onSignupPressed,
                        text: AppStrings.signup,
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

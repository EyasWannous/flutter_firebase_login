import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/login/login.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/bloc_logo_small.png',
                height: 120,
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 90,
                child: EmailInput(),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                height: 90,
                child: PasswordInput(),
              ),
              const SizedBox(height: 8),
              const LoginButton(),
              const SizedBox(height: 8),
              const GoogleLoginButton(),
              const SizedBox(height: 4),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

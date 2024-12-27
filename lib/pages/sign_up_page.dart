import 'package:aora_new/auth_notifier/auth_notifier.dart';
import 'package:aora_new/auth_notifier/auth_state.dart';
import 'package:aora_new/components/widgets/gradient_button.dart';
import 'package:aora_new/components/widgets/text_field.dart';
import 'package:aora_new/pages/sign_in_page.dart';
import 'package:aora_new/types/types.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  static const String name = 'Signup';
  final SignupCallback onSignup;
  const SignUpPage({super.key, required this.onSignup});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 122),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 115,
              ),
              const SizedBox(height: 40),
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Username',
                      hint: 'Your unique username',
                      controller: usernameController,
                      errorMessage: 'Username is required',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email',
                      hint: 'Your email address',
                      controller: emailController,
                      errorMessage: 'Email is required',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Password',
                      hint: 'Your password',
                      controller: passwordController,
                      obscureText: true,
                      isPasswordField: true,
                      errorMessage: 'Password is required',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Consumer(builder: (context, ref, _) {
                  final authState = ref.watch(authProvider);
                  return GradientButton(
                    text: 'Sign Up',
                    onPressed: () => widget.onSignup(usernameController.text,
                        emailController.text, passwordController.text),
                    isLoading: authState.status == AuthStatus.loading,
                  );
                }),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(SignInPage.name);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

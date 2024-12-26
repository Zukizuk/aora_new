// import 'package:aora_new/components/services/auth_services.dart';
// import 'package:aora_new/components/widgets/gradient_button.dart';
// import 'package:aora_new/components/widgets/text_field.dart';
// import 'package:aora_new/utils/theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _authService = AuthService();

//   bool isLoading = false;

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => isLoading = true);

//       try {
//         UserCredential? userCredential = await _authService.signIn(
//           emailController.text,
//           passwordController.text,
//         );
//         print('User: ${userCredential?.user}');
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Sign in failed: $e')),
//         );
//       } finally {
//         if (mounted) {
//           setState(() => isLoading = false);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 122),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   'assets/images/logo.png',
//                   width: 115,
//                 ),
//                 const SizedBox(height: 40),
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                   textAlign: TextAlign.start,
//                 ),
//                 const SizedBox(height: 32),
//                 Column(
//                   children: [
//                     CustomTextField(
//                       label: 'Email',
//                       hint: 'Your email address',
//                       controller: emailController,
//                     ),
//                     const SizedBox(height: 22),
//                     CustomTextField(
//                       label: 'Password',
//                       hint: 'Your password',
//                       controller: passwordController,
//                       obscureText: true,
//                       isPasswordField: true,
//                     ),
//                     const SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Forgot Password?',
//                           style: TextStyle(
//                             color: AppColors.accent,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: GradientButton(
//                     text: 'Sign In',
//                     onPressed: _submitForm,
//                     isLoading: isLoading,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Text.rich(
//                     TextSpan(
//                       text: 'Don\'t have an account? ',
//                       style: TextStyle(
//                         color: AppColors.accent,
//                         fontSize: 16,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Signup',
//                           style: TextStyle(
//                             color: Theme.of(context).primaryColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.pushNamed(context, '/sign-up');
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

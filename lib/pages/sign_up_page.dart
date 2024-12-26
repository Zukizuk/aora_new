// import 'package:aora_new/components/services/auth_services.dart';
// import 'package:aora_new/components/widgets/gradient_button.dart';
// import 'package:aora_new/components/widgets/text_field.dart';
// import 'package:aora_new/utils/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController usernameController = TextEditingController();

//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final _authService = AuthService();

//   bool isLoading = false;

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => isLoading = true);

//       try {
//         // Check username availability
//         bool isAvailable = await _authService.isUsernameAvailable(
//           usernameController.text,
//         );
//         if (!isAvailable) {
//           if (mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Username already taken')),
//             );
//           }
//           return;
//         }
//         await _authService.signUp(
//           emailController.text,
//           passwordController.text,
//           usernameController.text,
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
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 122),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(
//                 'assets/images/logo.png',
//                 width: 115,
//               ),
//               const SizedBox(height: 40),
//               Text(
//                 'Sign Up',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//               const SizedBox(height: 32),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     CustomTextField(
//                       label: 'Username',
//                       hint: 'Your unique username',
//                       controller: usernameController,
//                       errorMessage: 'Username is required',
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                       label: 'Email',
//                       hint: 'Your email address',
//                       controller: emailController,
//                       errorMessage: 'Email is required',
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                       label: 'Password',
//                       hint: 'Your password',
//                       controller: passwordController,
//                       obscureText: true,
//                       isPasswordField: true,
//                       errorMessage: 'Password is required',
//                     ),
//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: GradientButton(
//                   text: 'Sign Up',
//                   onPressed: _submitForm,
//                   isLoading: isLoading,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Text.rich(
//                   TextSpan(
//                     text: 'Already have an account? ',
//                     style: TextStyle(
//                       color: AppColors.accent,
//                       fontSize: 16,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Log In',
//                         style: TextStyle(
//                           color: Theme.of(context).primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.pushNamed(context, '/sign-in');
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

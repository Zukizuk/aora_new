import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  final Widget signedInScreen;
  final Widget signedOutScreen;
  final Widget signUpScreen;

  const AuthGate({
    super.key,
    required this.signedInScreen,
    required this.signedOutScreen,
    required this.signUpScreen,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final currentRoute = ModalRoute.of(context)?.settings.name;

        if (snapshot.hasData) {
          return signedInScreen;
        } else if (currentRoute == '/sign-up') {
          return signUpScreen;
        } else {
          return signedOutScreen;
        }
      },
    );
  }
}

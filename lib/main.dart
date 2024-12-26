import 'package:aora_new/components/layouts/layout.dart';
import 'package:aora_new/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client.setProject('676ccbcd002332a04207');

  Account account = Account(client);
  runApp(MyApp(account: account));
}

class MyApp extends StatelessWidget {
  final Account account;
  MyApp({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      home: Layout(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => AuthGate(
      //         signedInScreen: Layout(),
      //         signedOutScreen: SignInPage(),
      //         signUpScreen: SignUpPage(),
      //       ),
      //   '/sign-up': (context) => AuthGate(
      //         signedInScreen: Layout(),
      //         signedOutScreen: SignInPage(),
      //         signUpScreen: SignUpPage(),
      //       ),
      //   '/sign-in': (context) => AuthGate(
      //         signedInScreen: Layout(),
      //         signedOutScreen: SignInPage(),
      //         signUpScreen: SignUpPage(),
      //       ),
      // },
    );
  }
}

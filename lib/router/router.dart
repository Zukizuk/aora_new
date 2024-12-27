import 'dart:convert';
import 'package:aora_new/appwrite/appwrite.dart';
import 'package:aora_new/components/layouts/layout.dart';
import 'package:aora_new/pages/sign_in_page.dart';
import 'package:aora_new/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          name: SignInPage.name,
          path: '/',
          builder: (_, __) {
            return SignInPage(onSignin: (email, password) async {
              debugPrint('email: $email, password: $password');
              final appwrite = GetIt.instance.get<Appwrite>();
              final session =
                  await appwrite.createEmailSession(email, password);
              debugPrint(jsonEncode(session?.toMap() ?? '{}'));
            });
          },
        ),
        GoRoute(
          name: Layout.name,
          path: '/signup',
          builder: (_, __) {
            return SignUpPage(onSignup: (name, email, password) async {
              debugPrint('name: $name, email: $email, password: $password');
              final appwrite = GetIt.instance.get<Appwrite>();
              final user = await appwrite.createAccount(name, email, password);

              debugPrint(jsonEncode(user ?? '{}'));
            });
          },
        ),
        GoRoute(
          name: SignInPage.name,
          path: '/signin',
          builder: (_, __) {
            return SignInPage(onSignin: (email, password) async {
              debugPrint('email: $email, password: $password');
              final appwrite = GetIt.instance.get<Appwrite>();
              final session =
                  await appwrite.createEmailSession(email, password);
              debugPrint(jsonEncode(session?.toMap() ?? '{}'));
            });
          },
        ),
      ],
    );
  },
);

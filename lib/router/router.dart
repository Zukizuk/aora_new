import 'package:aora_new/auth_notifier/auth_notifier.dart';
import 'package:aora_new/auth_notifier/auth_state.dart';
import 'package:aora_new/components/layouts/layout.dart';
import 'package:aora_new/pages/loading_page.dart';
import 'package:aora_new/pages/sign_in_page.dart';
import 'package:aora_new/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    return GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (_, __) {
              if (authState.status == AuthStatus.authenticating) {
                return const LoadingPage();
              } else {
                return const Layout();
              }
            },
          ),
          GoRoute(
            name: SignUpPage.name,
            path: '/signup',
            builder: (_, __) {
              return SignUpPage(onSignup: (name, email, password) async {
                await authNotifier.signup(name, email, password);
              });
            },
          ),
          GoRoute(
            name: SignInPage.name,
            path: '/signin',
            builder: (_, __) {
              return SignInPage(onSignin: (email, password) async {
                await authNotifier.login(email, password);
              });
            },
          ),
        ],
        redirect: (context, state) {
          final location = state.matchedLocation;

          if (authState.status == AuthStatus.loading) {
            return null;
          }

          if (location == '/signup' || location == '/signin') {
            if (authState.status == AuthStatus.authenticated) {
              return '/';
            }
          }

          if (location == '/') {
            if (authState.status == AuthStatus.unauthenticated) {
              return '/signin';
            }
          }
          return null;
        });
  },
);

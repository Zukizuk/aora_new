import 'package:aora_new/appwrite/appwrite.dart';
import 'package:aora_new/models/user.model.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'auth_state.dart';

/// Define auth provider using the AuthNotifier and AuthState we created
final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

/// Auth notifier class will held the auth state
/// and also provide methods for authentication that in
/// turn will use the Appwrite authentication methods
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(status: AuthStatus.authenticating)) {
    authenticate();
  }

  /// Get appwrite as auth provider from dependency injection
  final authProvider = GetIt.I.get<Appwrite>();

  /// Function to authenticate user, that will try to get user account
  /// and update the state based on the result
  authenticate() async {
    try {
      final authProvider = GetIt.I.get<Appwrite>();
      final user = await authProvider.getAccount();
      state = state.copyWith(
          user: User.fromMap(user.toMap()),
          error: null,
          status: AuthStatus.authenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }

  /// Function to log user out and update the state accordingly
  logout() async {
    try {
      await authProvider.logout();
      state = state.copyWith(
          error: null, user: null, status: AuthStatus.unauthenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(error: e.message);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Function to log user in and update the state accordingly
  login(String email, String password) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      await authProvider.createEmailSession(email, password);
      authenticate();
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }

  /// Method to create new user account
  signup(String name, String email, String password) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      await authProvider.createAccount(name, email, password);
      login(email, password);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

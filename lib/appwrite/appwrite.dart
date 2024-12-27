import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class Appwrite {
  Client client = Client();
  late final Account account;
  Appwrite() {
    client
        .setProject('676ccbcd002332a04207')
        .setEndpoint('https://cloud.appwrite.io/v1');
    account = Account(client);
  }

  Future<User?> createAccount(
      String name, String email, String password) async {
    try {
      final user = await account.create(
          userId: ID.unique(), name: name, email: email, password: password);
      return user;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}

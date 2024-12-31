import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class Appwrite {
  Client client = Client();
  late final Account account;
  late final Databases database;
  late final Avatars avatars;
  late final Storage storage;
  static const String databaseId = '6772a71e003c283e7137';
  static const String videosCollectionId = '6772a73600056a433911';
  static const String usersCollectionId = '6772a72c001eaca6a287';
  static const String storageId = '6773180e00368adbbd20';

  Appwrite() {
    client
        .setProject('676ccbcd002332a04207')
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setSelfSigned(status: true);

    account = Account(client);
    database = Databases(client);
    avatars = Avatars(client);
    storage = Storage(client);
  }

  Future<Document> createAccount(
      String name, String email, String password) async {
    try {
      final user = await account.create(
          userId: ID.unique(), name: name, email: email, password: password);

      await createEmailSession(email, password);
      Uint8List bytes = await avatars.getInitials(name: name);
      final file = await storage.createFile(
        bucketId: storageId,
        file: InputFile.fromBytes(
          bytes: bytes,
          filename: '${name.toLowerCase()}-avatar.png',
        ),
        fileId: ID.unique(),
      );
      final id = file.$id;
      final newUser = await database.createDocument(
          databaseId: databaseId,
          collectionId: usersCollectionId,
          documentId: ID.unique(),
          data: {
            'username': name,
            'email': email,
            'avatar':
                'https://cloud.appwrite.io/v1/storage/buckets/$storageId/files/$id/view?project=676ccbcd002332a04207&project=676ccbcd002332a04207&mode=admin',
            'accountId': user.$id
          });
      return newUser;
    } on AppwriteException catch (e, stackTrace) {
      debugPrint(e.message);
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Future<User> getAccount() async {
    try {
      final user = await account.get();

      return user;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  Future<Session> createEmailSession(String email, String password) async {
    try {
      final session = await account.createEmailPasswordSession(
          email: email, password: password);
      return session;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      return true;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
}

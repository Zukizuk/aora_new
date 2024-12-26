import 'package:appwrite/appwrite.dart';

class Appwrite {
  Client client = Client();

  Appwrite() {
    client
        .setProject('676ccbcd002332a04207')
        .setEndpoint('https://cloud.appwrite.io/v1');
  }
}

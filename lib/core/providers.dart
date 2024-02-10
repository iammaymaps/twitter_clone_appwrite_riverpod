import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
});

final appwriteAccountprovider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

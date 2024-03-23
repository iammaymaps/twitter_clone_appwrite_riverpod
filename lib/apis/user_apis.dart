import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/appwrite_constants.dart';

import 'package:twitter_clone_appwrite_riverpod/core/core.dart';
import 'package:twitter_clone_appwrite_riverpod/core/providers.dart';
import 'package:twitter_clone_appwrite_riverpod/models/user_models.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appwriteDatabaseProvider));
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModels userModels);
  Future<model.Document> getUserData(String uid);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  UserAPI({
    required Databases db,
  }) : _db = db;
  @override
  FutureEitherVoid saveUserData(UserModels userModels) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollection,
        documentId: userModels.uid,
        data: userModels.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<model.Document> getUserData(String uid) {
    return _db.getDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.usersCollection,
      documentId: uid,
    );
  }
}

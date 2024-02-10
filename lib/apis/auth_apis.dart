import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_appwrite_riverpod/core/failure.dart';
import 'package:twitter_clone_appwrite_riverpod/core/providers.dart';

import 'package:twitter_clone_appwrite_riverpod/core/type_def.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountprovider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.User> signup({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({
    required Account account,
  }) : _account = account;
  @override
  FutureEither<model.User> signup(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? "Some unexpected error occured", stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}

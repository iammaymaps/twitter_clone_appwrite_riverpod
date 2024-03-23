import 'package:flutter/widgets.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_appwrite_riverpod/apis/auth_apis.dart';
import 'package:twitter_clone_appwrite_riverpod/apis/user_apis.dart';
import 'package:twitter_clone_appwrite_riverpod/core/utils.dart';
import 'package:twitter_clone_appwrite_riverpod/features/Home/home_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/view/login_view.dart';
import 'package:twitter_clone_appwrite_riverpod/models/user_models.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authAPI: ref.watch(authAPIProvider), userAPI: ref.watch(userAPIProvider));
});

// final currentUserDetailsProvider = FutureProvider((ref) async {
//   final userAccount = ref.watch(currentAuthProvider).value;
//   if (userAccount != null) {
//     final currentUserId = userAccount.$id;
//     final userDetails = ref.watch(userDetailsProvider(currentUserId));
//     return userDetails.value;
//   } else {
//     // handle the situation when userAccount is null
//     return null;
//   }
// });

final currentUserDetailsProvider = FutureProvider((ref) {
  final currentUserId = ref.watch(currentAuthProvider).value!.$id;
  final userDetails = ref.watch(userDetailsProvider(currentUserId));
  return userDetails.value;
});

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});
final currentAuthProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
  final user = await authController.currentUser();
  print('User: $user');
  return user;
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  Future<model.User?> currentUser() => _authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signup(email: email, password: password);
    state = false;
    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) async {
      UserModels userModels = UserModels(
          email: email,
          name: geteNameFromEmail(email),
          profilePic: '',
          bannerPic: '',
          uid: r.$id,
          bio: '',
          isTwitterblue: false,
          followers: const [],
          followings: const []);
      final res2 = await _userAPI.saveUserData(userModels);
      res2.fold((l) {
        showSnackBar(context, l.message);
      }, (r) {
        showSnackBar(context, 'Accounted created!.');
        Navigator.pushNamed(context, LoginView.routeName);
      });
    });
  }

  void logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.login(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      Navigator.pushNamed(context, Homeview.routeName);
    });
  }

  Future<UserModels> getUserData(String uid) async {
    final document = await _userAPI.getUserData(uid);
    final updateUserdata = UserModels.fromMap(document.data);
    return updateUserdata;
  }
}

//65e087271dcb9b44f6d3
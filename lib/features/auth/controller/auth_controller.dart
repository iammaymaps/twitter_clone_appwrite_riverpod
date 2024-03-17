import 'package:flutter/widgets.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_appwrite_riverpod/apis/auth_apis.dart';
import 'package:twitter_clone_appwrite_riverpod/apis/user_apis.dart';
import 'package:twitter_clone_appwrite_riverpod/core/utils.dart';
import 'package:twitter_clone_appwrite_riverpod/features/Home/home_view.dart';
import 'package:twitter_clone_appwrite_riverpod/models/user_models.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authAPI: ref.watch(authAPIProvider), userAPI: ref.watch(userAPIProvider));
});

final currentAuthProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);

  return authController.currentUser();
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
          name: "",
          profilePic: "",
          bannerPic: "",
          uid: "uid",
          bio: "",
          isTwitterblue: false,
          followers: [],
          followings: []);
      final res2 = await _userAPI.saveUserData(userModels);
      res2.fold((l) {
        showSnackBar(context, l.message);
      }, (r) {
        Navigator.pushNamed(context, Homeview.routeName);
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
}
 


//65e087271dcb9b44f6d3
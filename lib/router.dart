import 'package:flutter/material.dart';
import 'package:twitter_clone_appwrite_riverpod/common/error.dart';
import 'package:twitter_clone_appwrite_riverpod/features/Home/home_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/view/login_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/view/signup_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/tweet/views/create_tweet_Screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case Homeview.routeName:
      return MaterialPageRoute(builder: (context) => const Homeview());
    case CreateTweetScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CreateTweetScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'This page doesn\'t exist'),
              ));
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_appwrite_riverpod/common/rounded_small_button.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/UI_constants.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/view/login_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone_appwrite_riverpod/theme/pallete.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static route() => MaterialPageRoute(builder: (context) => const SignupView());
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final appbar = UIConstants.appBar();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(
                    controller: emailController, hintText: "Email address"),
                const SizedBox(height: 25),
                AuthField(controller: passwordController, hintText: "Password"),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: () {},
                    label: 'Done',
                  ),
                ),
                const SizedBox(height: 40),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                      TextSpan(
                          text: 'Log in',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginView.route());
                            }),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

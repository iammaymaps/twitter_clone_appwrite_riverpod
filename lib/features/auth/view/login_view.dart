import 'package:flutter/material.dart';
import 'package:twitter_clone_appwrite_riverpod/common/rounded_small_button.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/UI_constants.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/widgets/auth_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                AuthField(
                    controller: emailController, hintText: "Email address"),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                      onTap: onTap,
                      label: label,
                      backgroundColor: backgroundColor,
                      textColor: textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

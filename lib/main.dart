import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_appwrite_riverpod/common/error.dart';
import 'package:twitter_clone_appwrite_riverpod/common/loading_page.dart';
import 'package:twitter_clone_appwrite_riverpod/features/Home/home_view.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/view/login_view.dart';
import 'package:twitter_clone_appwrite_riverpod/router.dart';
import 'package:twitter_clone_appwrite_riverpod/theme/app_theme.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
            const ProviderScope(child: MyApp()), // Wrap your app
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(currentAuthProvider).when(
          data: (user) {
            if (user != null) {
              return const Homeview();
            }
            return const LoginView();
          },
          error: (error, st) {
            ErrorPage(error: error.toString());
            print("$error is gone");
          },
          loading: () => const LoadingPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/views/end_users_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/views/reports_screen.dart';
import 'package:furni_move/view/features/end_user/client/account/views/client_account_screen.dart';
import 'package:furni_move/view/features/end_user/client/activity/views/client_activity_screen.dart';
import 'package:furni_move/view/features/end_user/client/home/views/home_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/account/views/provider_account_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/provider_activity_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/provider_request_screen.dart';
import 'package:furni_move/view/features/registration/views/login_screen.dart';
import 'package:furni_move/view/features/registration/views/signup_screen.dart';
import 'package:furni_move/view/features/registration/views/welcome_screen.dart';
import 'package:furni_move/view/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        Routes.splashRoute: (context) => const SplashScreen(),
        Routes.welcomeRoute: (context) => const WelcomeScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
        Routes.signUpRoute: (context) => const SignUpScreen(),
        Routes.baseRoute: (context) => const BaseScreen(),
        Routes.homeRoute: (context) => const HomeScreen(),
        Routes.clientActivityRoute: (context) => const ClientActivityScreen(),
        Routes.clientAccountRoute: (context) => const ClientAccountScreen(),
        Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        Routes.adminEndUsersRoute: (context) => const EndUsersScreen(),
        Routes.adminReportsRoute: (context) => const ReportsScreen(),
        Routes.providerAccountRoute: (context) => const ProviderAccountScreen(),
        Routes.providerActivityRoute: (context) =>
            const ProviderActivityScreen(),
        Routes.providerRequestsRoute: (context) => const RequestsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
    );
  }
}

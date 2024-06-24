import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/editprofile_screen.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/request_details_screen.dart';
import 'package:furni_move/view/features/registration/views/login_screen.dart';
import 'package:furni_move/view/features/registration/views/signup_screen.dart';
import 'package:furni_move/view/features/registration/views/welcome_screen.dart';
import 'package:furni_move/view/features/splash_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';

void main() {
  DioHelper.init();
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
        Routes.editProfile: (context) => const EditProfileScreen(),
        Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        Routes.providerRequestDetailsRoute: (context) =>
            const RequestDetailsScreen(),
        Routes.providerRequestMapRoute: (context) => const RequestMapScreen(),

        // Routes.homeRoute: (context) => const HomeScreen(),
        // Routes.clientActivityRoute: (context) => const ClientActivityScreen(),
        // Routes.clientAccountRoute: (context) => const ClientAccountScreen(),
        // Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        // Routes.adminEndUsersRoute: (context) => const EndUsersScreen(),
        // Routes.adminReportsRoute: (context) => const ReportsScreen(),
        // Routes.providerAccountRoute: (context) => const ProviderAccountScreen(),
        // Routes.providerActivityRoute: (context) =>
        //     const ProviderActivityScreen(),
        // Routes.providerRequestsRoute: (context) => const RequestsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
    );
  }
}

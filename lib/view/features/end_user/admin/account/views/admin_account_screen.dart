import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/user_confirmation.dart';
import 'package:furni_move/view/core/custom_widgets/user_profile.dart';

class AdminAccountScreen extends StatelessWidget {
  const AdminAccountScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(user.token);
    // DateTime expirationDate = JwtDecoder.getExpirationDate(user.token);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 28),
            UserProfile(user: user),
            const SizedBox(height: 28),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(user.role,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppTheme.blackText.withOpacity(0.8)))),
            Divider(thickness: 4, color: AppTheme.dividerGrey),
            const SizedBox(height: 28),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Account Confirmed',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            const SizedBox(height: 28),
            UserConfirmation(user: user),
            const SizedBox(height: 28),
            Divider(thickness: 4, color: AppTheme.dividerGrey),
            const SizedBox(height: 28),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, Routes.welcomeRoute),
                  text: 'Sign Out',
                  color: AppTheme.red,
                  radius: 8,
                  height: 50,
                  width: 180),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';

import 'package:furni_move/view/core/custom_widgets/user_profile.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';

class ProviderAccountScreen extends StatefulWidget {
  const ProviderAccountScreen({
    super.key,
  });

  @override
  State<ProviderAccountScreen> createState() => _ProviderAccountScreenState();
}

class _ProviderAccountScreenState extends State<ProviderAccountScreen> {
  void _refreshData() {
    setState(() {
      // Refresh the data or state here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 0),
            UserProfile(
              user: user,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    textColor: AppTheme.white,
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, Routes.loginRoute),
                    text: 'Sign Out',
                    color: AppTheme.red,
                    radius: 8,
                    height: 40,
                    width: 150),
                CustomButton(
                    textColor: AppTheme.white,
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                          context, Routes.editProfile);
                      if (result == true) {
                        _refreshData();
                      }
                    },
                    text: 'Edit Profile',
                    color: AppTheme.primarylight,
                    radius: 8,
                    height: 40,
                    width: 150),
              ],
            )
          ],
        ),
      ),
    );
  }
}

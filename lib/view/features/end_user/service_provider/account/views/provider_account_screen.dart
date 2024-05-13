import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/user_activity_stats.dart';
import 'package:furni_move/view/core/custom_widgets/user_confirmation.dart';
import 'package:furni_move/view/core/custom_widgets/user_profile.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class ProviderAccountScreen extends StatelessWidget {
  const ProviderAccountScreen({super.key, required this.user});
  final UserModel user;

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
            UserProfile(user: user),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    textColor: AppTheme.white,
                    onPressed: () async {
                      await DioHelper.postData(
                              endPoint: EndPoints.logout, token: user.token)
                          .timeout(Duration(seconds: 5));
                      user.token = '';
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    text: 'Sign Out',
                    color: AppTheme.red,
                    radius: 8,
                    height: 40,
                    width: 150),
                CustomButton(
                    textColor: AppTheme.white,
                    onPressed: () => Navigator.pushNamed(
                        context, Routes.editProfile,
                        arguments: user),
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

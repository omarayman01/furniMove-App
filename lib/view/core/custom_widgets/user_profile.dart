import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Avatar(
          backColor: AppTheme.primarylight,
        ),
        const SizedBox(width: 50),
        Text(
          user.userName,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 24),
        ),
        const SizedBox(width: 32),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.verified, color: AppTheme.red),
          iconSize: 28,
        )
      ],
    );
  }
}

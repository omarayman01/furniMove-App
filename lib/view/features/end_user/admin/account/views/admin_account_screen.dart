import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AdminAccountScreen extends StatelessWidget {
  const AdminAccountScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(user.token);
    DateTime expirationDate = JwtDecoder.getExpirationDate(user.token);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          Text(user.phoneNumber),
          Text(user.id),
          Text(user.userName),
          Text(user.email),
          Text(decodedToken.toString()),
          Text(expirationDate.toString()),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.welcomeRoute),
                text: 'Sign Out',
                color: AppTheme.primarylight,
                radius: 8,
                height: 50,
                width: 180),
          ),
        ],
      ),
    );
  }
}

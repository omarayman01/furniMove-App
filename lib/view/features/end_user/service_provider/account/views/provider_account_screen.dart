import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';

class ProviderAccountScreen extends StatelessWidget {
  const ProviderAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}

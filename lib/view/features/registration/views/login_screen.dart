import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/registration/widgets/register_option.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          const LogoColumn(),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.welcomeRoute);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Log In',
                    style: Theme.of(context).textTheme.displayMedium)),
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(labelText: 'E-mail', radius: 8),
          const SizedBox(height: 10),
          const CustomTextFormField(labelText: 'Password', radius: 8),
          const SizedBox(height: 10),
          CustomButton(
              text: 'Log In',
              color: AppTheme.primarylight,
              radius: 6,
              height: 50,
              width: 220,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, Routes.baseRoute,
                  arguments: args)),
          const SizedBox(height: 100),
          args == 'admin'
              ? const SizedBox()
              : RegisterOption(
                  txt1: 'Don`t have an account?  ',
                  txt2: 'Sign up',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, Routes.signUpRoute,
                      arguments: args))
        ],
      ),
    );
  }
}

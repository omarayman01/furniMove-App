import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/registration/widgets/register_option.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Sign Up',
                    style: Theme.of(context).textTheme.displayMedium)),
          ),
          Text('Create your own account',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppTheme.grey)),
          const SizedBox(height: 1),
          const CustomTextFormField(labelText: 'UserName', radius: 8),
          const CustomTextFormField(labelText: 'E-mail', radius: 8),
          const CustomTextFormField(labelText: 'Password', radius: 8),
          const CustomTextFormField(labelText: 'PhoneNumber', radius: 8),
          const SizedBox(height: 5),
          CustomButton(
              text: 'Sign Up',
              color: AppTheme.primarylight,
              radius: 6,
              height: 50,
              width: 220,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, Routes.baseRoute,
                  arguments: args)),
          const SizedBox(height: 5),
          RegisterOption(
              txt1: 'Already a member?  ',
              txt2: 'Log In',
              onTap: () => Navigator.pushReplacementNamed(
                  context, Routes.loginRoute,
                  arguments: args))
        ],
      ),
    );
  }
}

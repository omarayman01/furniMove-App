import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/data.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/registration/widgets/register_option.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  late UserModel user;
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const LogoColumn(),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.welcomeRoute);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Sign Up',
                      style: Theme.of(context).textTheme.displayMedium)),
            ),
            Text('Create your own account',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.grey)),
            const SizedBox(height: 1),
            CustomTextFormField(
                controller: userNameController,
                labelText: 'UserName',
                radius: 8),
            CustomTextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Email must be not empty!!';
                  } else if (!RegExp(validationEmail).hasMatch(value.trim())) {
                    return 'Email is not valid!';
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                labelText: 'E-mail',
                radius: 8),
            CustomTextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Email must be not empty!!';
                  } else if (!RegExp(validationPassword)
                      .hasMatch(value.trim())) {
                    return 'Email is not valid!';
                  } else {
                    return null;
                  }
                },
                controller: passwordController,
                labelText: 'Password',
                radius: 8),
            CustomTextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Email must be not empty!!';
                  } else if (!RegExp(validationPhone).hasMatch(value.trim())) {
                    return 'Email is not valid!';
                  } else {
                    return null;
                  }
                },
                controller: phoneController,
                labelText: 'PhoneNumber',
                radius: 8),
            const SizedBox(height: 5),
            CustomButton(
                textColor: AppTheme.white,
                text: 'Sign Up',
                color: AppTheme.primarylight,
                radius: 6,
                height: 50,
                width: 220,
                onPressed: () async {
                  await signUp(emailController.text, passwordController.text,
                      userNameController.text, phoneController.text, args);
                  Navigator.pushReplacementNamed(context, Routes.loginRoute,
                      arguments: args);
                }),
            const SizedBox(height: 5),
            RegisterOption(
                txt1: 'Already a member?  ',
                txt2: 'Log In',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Routes.loginRoute,
                    arguments: args))
          ],
        ),
      ),
    );
  }

  Future<void> signUp(String email, String password, String userName,
      String phoneNumber, String role) async {
    if (formKey.currentState?.validate() == true) {
      Response response =
          await DioHelper.postData(endPoint: EndPoints.register, data: {
        'password': password,
        'Email': email,
        'username': userName,
        'phoneNumber': phoneNumber,
        'role': role
      });
      debugPrint('sign up page!!!!');
      Map<String, dynamic> data = response.data;
      debugPrint(data.toString());
      user = UserModel.fromJson(data);
    }
  }
}

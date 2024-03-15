import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late UserModel user;
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Column(
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
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Log In',
                        style: Theme.of(context).textTheme.displayMedium)),
              ),
              const SizedBox(height: 30),
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
                labelText: 'E-mail',
                radius: 8,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Password must be not empty!!';
                  } else if (!RegExp(validationPassword2)
                      .hasMatch(value.trim())) {
                    return 'Password is not valid!';
                  } else {
                    return null;
                  }
                },
                isPassword: isVisiblePassword,
                suffixIcon: isVisiblePassword
                    ? InkWell(
                        onTap: () {
                          isVisiblePassword = !isVisiblePassword;
                          setState(() {});
                        },
                        child: const Icon(Icons.visibility_off))
                    : InkWell(
                        onTap: () {
                          isVisiblePassword = !isVisiblePassword;
                          setState(() {});
                        },
                        child: const Icon(Icons.remove_red_eye)),
                labelText: 'Password',
                radius: 8,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              CustomButton(
                  text: 'Log In',
                  color: AppTheme.primarylight,
                  radius: 6,
                  height: 50,
                  width: 220,
                  onPressed: () async {
                    await login(emailController.text, passwordController.text);
                    if (args == user.role) {
                      Navigator.pushReplacementNamed(context, Routes.baseRoute,
                          arguments: user);
                    } else {
                      Fluttertoast.showToast(
                        msg: "Account type not matchable",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  }),
              const SizedBox(height: 100),
              args == 'Admin'
                  ? const SizedBox()
                  : RegisterOption(
                      txt1: 'Don`t have an account?  ',
                      txt2: 'Sign up',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.signUpRoute,
                            arguments: args);
                      })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    // if (formKey.currentState?.validate() == true) {
    Response response = await DioHelper.postData(
        endPoint: EndPoints.login,
        data: {'password': password, 'username': email});
    debugPrint('login page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
    user = UserModel.fromJson(data);
  }
  // }
}

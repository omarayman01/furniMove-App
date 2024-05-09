import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/edit_credentials.dart';
import 'package:furni_move/view/core/custom_widgets/edit_photo.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const SizedBox(height: 20),
              EditPhoto(user: user),
              const SizedBox(height: 10),
              EditCredentials(user: user),
            ],
          ),
        ),
      ),
    );
  }
}

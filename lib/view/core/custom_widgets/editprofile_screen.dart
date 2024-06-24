import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/core/custom_widgets/edit_credentials.dart';
import 'package:furni_move/view/core/custom_widgets/edit_photo.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const SizedBox(height: 20),
              EditPhoto(),
              const SizedBox(height: 10),
              EditCredentials(),
            ],
          ),
        ),
      ),
    );
  }
}

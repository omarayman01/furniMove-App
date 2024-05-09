import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class EditCredentials extends StatefulWidget {
  const EditCredentials({super.key, required this.user});
  final UserModel user;

  @override
  State<EditCredentials> createState() => _EditCredentialsState();
}

class _EditCredentialsState extends State<EditCredentials> {
  var phoneController = TextEditingController();
  var newPasswordController = TextEditingController();
  var oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                CustomButton(
                    fontsize: 13,
                    text: widget.user.userName,
                    color: AppTheme.white,
                    radius: 8,
                    height: 40,
                    width: 150,
                    textColor: AppTheme.blackText,
                    borderColor: AppTheme.blackText.withOpacity(0.5))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                CustomButton(
                    fontsize: 13,
                    text: widget.user.email,
                    color: AppTheme.white,
                    radius: 8,
                    height: 40,
                    width: 180,
                    textColor: AppTheme.blackText,
                    borderColor: AppTheme.blackText.withOpacity(0.5))
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Role',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                CustomButton(
                    fontsize: 13,
                    text: widget.user.role,
                    color: AppTheme.white,
                    radius: 8,
                    height: 40,
                    width: 150,
                    textColor: AppTheme.blackText,
                    borderColor: AppTheme.blackText.withOpacity(0.5))
              ],
            ),
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('* Phone Number',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 3),
                SizedBox(
                  width: 177,
                  height: 58,
                  child: CustomTextFormField(
                    hor: 0,
                    vert: 8,
                    controller: phoneController,
                    radius: 8,
                    hintText: widget.user.phoneNumber,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('* Old Password',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.blackText, fontWeight: FontWeight.w800)),
            SizedBox(
              // width: 200,
              height: 90,
              child: CustomTextFormField(
                controller: oldPasswordController,
                hor: 0,
                vert: 15,
                radius: 8,
                hintText: '',
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('* New Password',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.blackText, fontWeight: FontWeight.w800)),
            SizedBox(
              // width: 200,
              height: 90,
              child: CustomTextFormField(
                controller: newPasswordController,
                hor: 0,
                vert: 15,
                radius: 8,
                hintText: '',
              ),
            ),
          ],
        ),
        // const Spacer(),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                borderColor: AppTheme.blackText,
                textColor: AppTheme.blackText,
                onPressed: () => Navigator.pop(context),
                text: 'Close',
                color: AppTheme.white,
                radius: 8,
                height: 50,
                width: 150),
            const SizedBox(width: 10),
            CustomButton(
                textColor: AppTheme.white,
                onPressed: () {
                  updateProfile(
                      phoneController.text,
                      newPasswordController.text,
                      oldPasswordController.text,
                      user.token);
                  const Duration(seconds: 2);
                  Navigator.pop(context);
                },
                text: 'Save changes',
                color: AppTheme.primarylight,
                radius: 8,
                height: 50,
                width: 150),
          ],
        ),
        const SizedBox(height: 0),
      ],
    );
  }

  Future<void> updateProfile(String phoneNumber, String newPassword,
      String oldPassword, String token) async {
    print(phoneNumber);
    print(oldPassword);
    print(newPassword);
    Response response = await DioHelper.patchData(
        token: token,
        endPoint: EndPoints.updateUser,
        data: {
          "phoneNumber": phoneNumber,
          "oldPassword": oldPassword,
          "password": newPassword
        });
    debugPrint('updateeeee page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
  }
}

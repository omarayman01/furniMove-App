import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class EditCredentials extends StatefulWidget {
  const EditCredentials({
    super.key,
  });

  @override
  State<EditCredentials> createState() => _EditCredentialsState();
}

class _EditCredentialsState extends State<EditCredentials> {
  var phoneController = TextEditingController();
  var newPasswordController = TextEditingController();
  var oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: user.userName!,
                      color: AppTheme.white,
                      radius: 8,
                      height: 40,
                      width: 140,
                      textColor: AppTheme.blackText,
                      borderColor: AppTheme.blackText.withOpacity(0.5))
                ],
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blackText,
                          fontWeight: FontWeight.w800)),
                  CustomButton(
                      fontsize: 13,
                      text: user.email!,
                      color: AppTheme.white,
                      radius: 8,
                      height: 40,
                      width: 150,
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
                      text: user.role!,
                      color: AppTheme.white,
                      radius: 8,
                      height: 40,
                      width: 140,
                      textColor: AppTheme.blackText,
                      borderColor: AppTheme.blackText.withOpacity(0.5))
                ],
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* Phone Number',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blackText,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 150,
                    height: 58,
                    child: CustomTextFormField(
                      hor: 0,
                      vert: 8,
                      controller: phoneController,
                      radius: 8,
                      hintText: user.phoneNumber,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('* Old Password',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    // width: 250,
                    height: 80,
                    child: CustomTextFormField(
                      controller: oldPasswordController,
                      hor: 0,
                      vert: 15,
                      radius: 8,
                      hintText: '',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('* New Password',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blackText,
                        fontWeight: FontWeight.w800)),
                SizedBox(
                  // width: 200,
                  height: 80,
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
                  onPressed: () => Navigator.pop(context, true),
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
                        user.token!);
                    updateData();
                    const Duration(seconds: 2);
                    Navigator.pop(context, true);
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
      ),
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

  Future<void> updateData() async {
    Response resp = await DioHelper.getData(
      endPoint: EndPoints.getUser,
      token: user.token,
    );
    debugPrint(resp.toString());
    debugPrint(resp.data.toString());
    UserModel user2;
    Map<String, dynamic> data = resp.data;
    debugPrint(data.toString());
    user2 = UserModel.fromJson(data);
    user.copyFrom(user2);
    print(user.imgURL.toString());
    print(user.token);
    setState(() {});
  }
}

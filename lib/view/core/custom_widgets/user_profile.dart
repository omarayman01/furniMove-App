import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.user});
  final UserModel user;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

int count = 0;

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    late String? text;
    late Color color;
    if (widget.user.emailConfirmed) {
      text = 'Verified';
      color = AppTheme.green;
    } else {
      text = 'Unverified';
      color = AppTheme.red;
    }
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Avatar(
            height: 80,
            width: 90,
            backColor: AppTheme.primarylight,
            url: widget.user.imgURL,
          ),
        ),
        CustomButton(
          onPressed: () {
            if (widget.user.emailConfirmed) {
            } else {
              if (count == 0) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: CustomButton(
                              onPressed: () {
                                verifyEmail(widget.user.token!);
                                count = 1;
                                Navigator.pop(context);

                                setState(() {});
                              },
                              text: 'Verify Account',
                              color: AppTheme.primarylight,
                              radius: 25,
                              height: 50,
                              width: 100,
                              textColor: AppTheme.white));
                    });
              }
              // Duration(seconds: 2);
              // Navigator.pop(context);
              if (count == 1) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: CustomButton(
                              onPressed: () {
                                // verifyEmail(widget.user.token!);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              text: 'Email Sent',
                              color: AppTheme.green,
                              radius: 25,
                              height: 50,
                              width: 90,
                              textColor: AppTheme.white));
                    });
              }
            }
          },
          textColor: AppTheme.white,
          fontsize: 11,
          text: text,
          color: color,
          radius: 50,
          height: 27,
          width: 120,
        ),
        const SizedBox(height: 8),
        Text(
          softWrap: true,
          maxLines: 1,
          widget.user.userName!,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 26),
        ),
        Text(
          softWrap: true,
          maxLines: 1,
          widget.user.role!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppTheme.blackText.withOpacity(0.8)),
        ),
        Row(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
                fontsize: 11,
                borderColor: AppTheme.blackText.withOpacity(0.3),
                textColor: AppTheme.blackText,
                text: widget.user.phoneNumber!,
                color: AppTheme.white,
                radius: 5,
                height: 30,
                width: 145),
            CustomButton(
                fontsize: 11,
                borderColor: AppTheme.blackText.withOpacity(0.3),
                textColor: AppTheme.blackText,
                text: widget.user.email!,
                color: AppTheme.white,
                radius: 5,
                height: 30,
                width: 145),
          ],
        ),
        const SizedBox(
          height: 0,
        ),
        Text(
          softWrap: true,
          maxLines: 1,
          'Moves Counter: ${widget.user.counter.toString()}',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppTheme.blackText),
        ),
      ],
    );
  }

  Future<void> verifyEmail(String token) async {
    // if (formKey.currentState?.validate() == true) {
    Response response = await DioHelper.postData(
        endPoint: EndPoints.confirmEmail, token: token);
    debugPrint('Confimmm page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
  }
}

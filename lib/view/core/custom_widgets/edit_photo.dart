import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({super.key, required this.user});
  final UserModel user;

  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  late File file;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Avatar(
          backColor: AppTheme.primarylight,
          url: widget.user.imgURL,
        ),
        const SizedBox(width: 20),
        CustomButton(
            onPressed: () async {
              await uploadPhoto();
            },
            fontsize: 11,
            text: 'Upload Photo',
            color: AppTheme.primarylight,
            radius: 8,
            height: 30,
            width: 100,
            textColor: AppTheme.white),
        const SizedBox(width: 20),
        CustomButton(
            onPressed: () => deletePhoto(widget.user.token),
            borderColor: AppTheme.blackText.withOpacity(0.3),
            fontsize: 12,
            text: 'Delete Photo',
            color: AppTheme.white,
            radius: 8,
            height: 30,
            width: 100,
            textColor: AppTheme.blackText)
      ],
    );
  }

  Future deletePhoto(String token) async {
    Response response = await DioHelper.deleteData(
      token: widget.user.token,
      endPoint: EndPoints.deleteUserImg,
    );
  }

  Future uploadPhoto() async {
    print(widget.user.token);

    print('photooStart');
    late File img;
    var picker;
    picker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (picker != null) {
      img = File(picker.path);
    }
    String filename = img.toString().split('/').last;
    // FormData formData = new FormData.fromMap({
    //   "img": await MultipartFile.fromFile.fromBytes(
    //     img.path,
    //     filename: filename,
    //   ),
    // });
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromBytes(
        img.readAsBytesSync(),
        filename: img.path.split('/').last,
        contentType: MediaType(
            'image', 'jpg'), // Adjust MediaType according to your image type
      ),
    });
    debugPrint(filename);
    debugPrint(img.path);
    print(formData.files);
    debugPrint(formData.toString());

    Response response = await DioHelper.postData(
      token: widget.user.token,
      endPoint: EndPoints.addUserImg,
      imgData: formData,
    );
    debugPrint('photoooo!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
    setState(() {});
  }
}

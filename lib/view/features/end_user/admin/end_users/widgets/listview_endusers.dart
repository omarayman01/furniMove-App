import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/custom_container_endusers.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';

import '../../../../../../view_model/database/network/end_point.dart';

class ListViewEndUsers extends StatelessWidget {
  const ListViewEndUsers({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return InkWell(
            onTap: () {
              getAllMoveRequestsCreated('created');
            },
            child: const CustomContainerEndusers());
      },
      itemCount: 10,
    );
  }

  Future<void> getAllMoveRequestsCreated(String status) async {
    // if (formKey.currentState?.validate() == true) {
    Response response = await DioHelper.getData(
      token: user.token,
      endPoint: EndPoints.getAllMoveRequests,
      // data: {
      //   'status': status,
      // },
    );
    debugPrint('getMOVES page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
    // user = UserModel.fromJson(data);
  }
}

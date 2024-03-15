import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    // getAllMoveRequests();
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: LogoColumn(),
          ),
        ],
      ),
    );
  }

  // void getAllMoveRequests() async {
  //   dynamic response = await DioHelper.getData(
  //     endPoint: EndPoints.getAllMoveRequests,
  //   );
  //   debugPrint('Client!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
  //   debugPrint(response.data.toString());
  // }
}

import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/custom_container_endusers.dart';

class ListViewEndUsers extends StatelessWidget {
  const ListViewEndUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return const CustomContainerEndusers();
      },
      itemCount: 10,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/current_request_listview.dart';

class CurrentRequestScreen extends StatelessWidget {
  const CurrentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: CurrentRequestListView())],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/requests_listview.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: RequestsListView()),
        ],
      ),
    );
  }
}

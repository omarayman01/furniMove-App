import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/moves_history_listview.dart';

class MovesHistoryScreen extends StatelessWidget {
  const MovesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: MovesHistoryListView())],
      ),
    );
  }
}

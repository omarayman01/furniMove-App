import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';

class OnGoingRequests extends StatelessWidget {
  const OnGoingRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return const CustomContainerReports();
      },
      itemCount: 2,
    );
  }
}

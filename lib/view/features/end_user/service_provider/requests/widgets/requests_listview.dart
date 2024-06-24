import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/request_card.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return const RequestsCard();
      },
      itemCount: 10,
    );
  }
}

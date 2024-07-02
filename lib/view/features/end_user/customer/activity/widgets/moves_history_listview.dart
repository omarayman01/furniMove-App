import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';

class MovesHistoryListView extends StatelessWidget {
  const MovesHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return;
        // MoveCard(
        //   request: state.requests[index],
        //   rate: true,
        // );
      },
      // itemCount: state.requests.length,
    );
  }
}

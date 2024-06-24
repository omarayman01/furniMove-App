import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';

class ServiceProviderOffersListView extends StatelessWidget {
  const ServiceProviderOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return const ServiceProviderOffer(
          rate: true,
        );
      },
      itemCount: 10,
    );
  }
}

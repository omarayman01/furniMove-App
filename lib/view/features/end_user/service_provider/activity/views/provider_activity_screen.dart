import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offers_listview.dart';

class ProviderActivityScreen extends StatelessWidget {
  const ProviderActivityScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
        ),
        body: Column(
          children: [
            // const LogoColumn(),
            Expanded(
              child: ContainedTabBarView(
                tabs: const [
                  Text('Current Offers'),
                  Text('Moves History'),
                ],
                views: const [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 50, bottom: 320, right: 20, left: 20),
                    child: ServiceProviderOffer(),
                  ),
                  ServiceProviderOffersListView(),
                ],
                // onChange: (index) => print(index),
              ),
            ),
          ],
        ));
  }
}

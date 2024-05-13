import 'package:flutter/material.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/modal_bottomsheet_offers.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer({
    super.key,
    required this.offer,
    this.color,
  });
  final OfferModel offer;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color ?? AppTheme.lightGrey.withOpacity(0.3),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar(
            backColor: AppTheme.primarylight,
            height: 64,
            width: 64,
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              const SizedBox(height: 5),
              Text(
                offer.moveRequest!.customer.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              Text(
                offer.moveRequest!.endLocation.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                offer.serviceProvider.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppTheme.grey),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // const Icon(Icons.star, color: Colors.yellow),
              Text(
                '${offer.price.toString()}\$',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

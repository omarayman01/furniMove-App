import 'package:flutter/material.dart';
import 'package:furni_move/model/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/modal_bottomsheet_offers.dart';

class CustomContainerReports extends StatelessWidget {
  const CustomContainerReports({
    super.key,
    required this.request,
    required this.user,
  });
  final RequestModel request;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          enableDrag: true,
          // shape: Border.symmetric(),
          elevation: 10,
          backgroundColor: Colors.transparent.withOpacity(0.2),
          context: context,
          builder: (_) => ModalBottomSheetOffers(
                id: request.id.toString(),
                user: user,
              )),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.lightGrey.withOpacity(0.3),
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
                  request.customer.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  '${request.cost.toString()}\$',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  request.endLocation.toString(),
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
                const Icon(Icons.star, color: Colors.yellow),
                Text(
                  request.rating.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

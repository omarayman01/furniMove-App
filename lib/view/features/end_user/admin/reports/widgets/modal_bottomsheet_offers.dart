import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/listview_offers.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/offers/offers_cubit.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';

class ModalBottomSheetOffers extends StatelessWidget {
  const ModalBottomSheetOffers(
      {super.key, required this.id, required this.user});

  @override
  final String id;
  final UserModel user;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OffersCubit(AdminRepoImpl())..fetchOffersbyId(user, id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Text(
              'Offers',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 24),
            ),
            const Expanded(child: ListViewOffers())
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';

class ServiceProviderCurrentOffer extends StatelessWidget {
  const ServiceProviderCurrentOffer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentMoveCubit, CurrentMoveState>(
      builder: (context, state) {
        if (state is CurrentMoveSuccess) {
          return MoveCard(
            request: state.request,
          );
        } else if (state is CurrentMoveFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

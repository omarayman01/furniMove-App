import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/moves_history/moves_history_cubit.dart';

class ServiceProviderOffersListView extends StatelessWidget {
  const ServiceProviderOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovesHistoryCubit, MovesHistoryState>(
      builder: (context, state) {
        if (state is MovesHistorySuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return MoveCard(
                request: state.requests[index],
                rate: true,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is MovesHistoryFailure) {
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

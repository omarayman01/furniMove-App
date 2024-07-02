import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_appliances/get_appliances_cubit.dart';

class RequestsCard extends StatelessWidget {
  const RequestsCard({super.key, required this.request});
  final RequestModel request;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          context
              .read<GetAppliancesCubit>()
              .fetchGetAppliances(user, request.id!);
          Navigator.pushNamed(context, Routes.providerRequestDetailsRoute,
              arguments: request);
        },
        child: Card(
          color: AppTheme.white,
          elevation: 10, // Shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Avatar(
                      url: request.customer!.userImgUrl,
                      backColor: AppTheme.primarylight,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      request.customer!.userName!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        request.startAddress!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        request.endAddress!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      request.startDate!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // Text(
                    //   '29/6/2024',
                    //   style: Theme.of(context).textTheme.bodyMedium,
                    // )
                  ],
                ),
                const SizedBox(height: 10),
                // Text(
                //   '50 \$',
                //   style: Theme.of(context).textTheme.bodyMedium,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

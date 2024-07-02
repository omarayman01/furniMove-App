import 'package:flutter/material.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';

class MoveCard extends StatelessWidget {
  const MoveCard({super.key, this.rate, required this.request});
  final bool? rate;
  final RequestModel request;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          if (rate == null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestMapScreen(request: request),
                ));
          }
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Avatar(
                      url: request.customer!.userImgUrl!,
                      backColor: AppTheme.primarylight,
                      height: 50,
                      width: 50,
                    ),
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
                        request.startAddress!.toString(),
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
                      width: 240,
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        request.endAddress!.toString(),
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
                      request.startDate!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // Text(
                    //   '29/6/2024',
                    //   style: Theme.of(context).textTheme.bodyMedium,
                    // )
                  ],
                ),
                const SizedBox(height: 10),
                rate != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${request.cost.toString()} \$',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                request.rating.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                              '${request.cost.toString()} \$',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

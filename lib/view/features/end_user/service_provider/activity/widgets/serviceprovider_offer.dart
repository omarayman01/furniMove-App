import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class ServiceProviderOffer extends StatelessWidget {
  const ServiceProviderOffer({super.key, this.rate});
  final bool? rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          if (rate == null) {
            Navigator.pushNamed(context, Routes.providerRequestMapRoute);
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
                      backColor: AppTheme.primarylight,
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      'Name',
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
                    Text(
                      'Elshrouk, Eltas3a',
                      style: Theme.of(context).textTheme.bodyMedium,
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
                    Text(
                      'NasrCity, Ard EL Golf',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '24/6/2024',
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
                            '50 \$',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                '4',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(
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
                              '50 \$',
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

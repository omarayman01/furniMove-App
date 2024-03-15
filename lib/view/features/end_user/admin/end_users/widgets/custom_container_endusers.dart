import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class CustomContainerEndusers extends StatelessWidget {
  const CustomContainerEndusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(width: 24),
          Column(
            children: [
              const SizedBox(height: 5),
              Text(
                'UserName',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Text(
                'E-mail',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.verified, color: AppTheme.red)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class CustomContainerEndusers extends StatelessWidget {
  const CustomContainerEndusers({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppTheme.lightGrey.withOpacity(0.3),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar(
            url: user.imgURL,
            backColor: AppTheme.primarylight,
            height: 64,
            width: 64,
          ),
          const SizedBox(width: 18),
          Column(
            children: [
              const SizedBox(height: 5),
              Text(
                user.userName!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 170,
                child: Text(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  user.email!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.verified,
              color: user.emailConfirmed ? AppTheme.green : AppTheme.red)
        ],
      ),
    );
  }
}

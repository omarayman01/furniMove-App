import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/confirmation_bottomsheet.dart';

class UserConfirmation extends StatelessWidget {
  const UserConfirmation({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'E-mail',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppTheme.grey),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => ConfirmationBottomSheet(
                        text: 'E-mail',
                        hintText: user.email,
                        radius: 5,
                      )),
              child: Text(
                'Verified',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.red),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phone',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppTheme.grey),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => ConfirmationBottomSheet(
                        text: 'Phone',
                        hintText: user.phoneNumber.toString(),
                        radius: 1,
                      )),
              child: Text(
                'Verified',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.red),
              ),
            ),
          ],
        )
      ],
    );
  }
}

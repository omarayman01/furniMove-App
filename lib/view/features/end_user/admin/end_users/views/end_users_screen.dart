import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/listview_endusers.dart';

class EndUsersScreen extends StatelessWidget {
  const EndUsersScreen({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoColumn(),
        Expanded(
          child: ContainedTabBarView(
            tabs: const [
              Text('Customers'),
              Text('Service Providers'),
            ],
            views: [
              ListViewEndUsers(user: user),
              ListViewEndUsers(user: user),
            ],
            // onChange: (index) => print(index),
          ),
        ),
      ],
    );
  }
}

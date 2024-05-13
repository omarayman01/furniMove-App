import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/listview_customers.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/listview_serviceproviders.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              const ListViewCustomers(),
              const ListViewServiceProviders(),
            ],
            // onChange: (index) => print(index),
          ),
        ),
      ],
    );
  }
}

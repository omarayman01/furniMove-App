import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/custom_container_endusers.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';

class ListViewCustomers extends StatelessWidget {
  const ListViewCustomers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) =>
          UsersCubit(AdminRepoImpl())..fetchUsers(user, 'customer'),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          // print(state.users);
          if (state is UsersSuccess) {
            return ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return CustomContainerEndusers(
                  user: state.users[index],
                );
              },
              itemCount: state.users.length,
            );
          } else if (state is UsersFailure) {
            return Text(state.errMessage,
                style: Theme.of(context).textTheme.bodyLarge);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

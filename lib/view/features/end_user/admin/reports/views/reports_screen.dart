import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/listview_reports.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/complained_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/completed_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/ongoing_requests.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/completed_requests/completed_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/offers/offers_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late Widget _activeWidget;
  late Widget _sizedWidget;

  String text = 'Requests';

  @override
  void initState() {
    _activeWidget = const ListViewReports();
    _sizedWidget = const SizedBox(width: 105);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreatedRequestsCubit(AdminRepoImpl())
            ..fetchCreatedRequests(widget.user),
        ),
        BlocProvider(
            create: (context) => CompletedRequestsCubit(AdminRepoImpl())
              ..fetchCompletedRequests(widget.user))
      ],
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 3,
                  color: AppTheme.lightGrey,
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                title: Text(
                  'Completed',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                leading: const Icon(Icons.check_box),
                onTap: () {
                  setState(() {
                    _activeWidget = CompletedRequests(
                      user: widget.user,
                    );
                    text = 'Completed Requests';
                    _sizedWidget = const SizedBox(width: 50);

                    Navigator.pop(context);
                  });
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'On Going',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                leading: const Icon(Icons.departure_board_outlined),
                onTap: () {
                  setState(() {
                    _activeWidget = OnGoingRequests(
                      user: widget.user,
                    );
                    text = 'On Going Requests';
                    _sizedWidget = const SizedBox(width: 55);
                    Navigator.pop(context);
                  });
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Complained',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                leading: const Icon(Icons.report_problem_outlined),
                onTap: () {
                  setState(() {
                    _activeWidget = const ComplainedRequests();
                    text = 'Complained Requests';
                    _sizedWidget = const SizedBox(width: 50);

                    Navigator.pop(context);
                  });
                },
              )
            ],
          ),
        ),
        key: scaffoldkey,
        body: Column(
          children: [
            const LogoColumn(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      scaffoldkey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.list, size: 34)),
                _sizedWidget,
                Text(
                  text,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            Expanded(
              child: _activeWidget,
            ),
          ],
        ),
      ),
    );
  }
}

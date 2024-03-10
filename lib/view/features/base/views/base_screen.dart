import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/views/end_users_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/views/reports_screen.dart';
import 'package:furni_move/view/features/end_user/client/account/views/client_account_screen.dart';
import 'package:furni_move/view/features/end_user/client/activity/views/client_activity_screen.dart';
import 'package:furni_move/view/features/end_user/client/home/views/home_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/account/views/provider_account_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/provider_activity_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/provider_request_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> clientTabs = const [
    HomeScreen(),
    ClientActivityScreen(),
    ClientAccountScreen()
  ];
  List<Widget> serviceProviderTabs = const [
    RequestsScreen(),
    ProviderActivityScreen(),
    ProviderAccountScreen()
  ];
  List<Widget> adminTabs = const [
    ReportsScreen(),
    EndUsersScreen(),
    AdminAccountScreen()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: displaybody(args)[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: displaynav(args)),
    );
  }

  dynamic displaynav(String value) {
    if (value == 'client') {
      return client;
    } else if (value == 'service provider') {
      return serviceProvider;
    } else if (value == 'admin') {
      return admin;
    }
  }

  dynamic displaybody(String value) {
    if (value == 'client') {
      return clientTabs;
    } else if (value == 'service provider') {
      return serviceProviderTabs;
    } else if (value == 'admin') {
      return adminTabs;
    }
  }
}

List<BottomNavigationBarItem> client = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined), label: 'Activity'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];
List<BottomNavigationBarItem> admin = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_outlined), label: 'Reports'),
  BottomNavigationBarItem(
      icon: Icon(Icons.groups_outlined), label: 'End Users'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];
List<BottomNavigationBarItem> serviceProvider = const [
  BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Requests'),
  BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined), label: 'Activity'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];

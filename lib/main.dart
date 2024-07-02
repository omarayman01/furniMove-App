import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/editprofile_screen.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/customer/home/views/map_location_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/request_details_screen.dart';
import 'package:furni_move/view/features/registration/views/login_screen.dart';
import 'package:furni_move/view/features/registration/views/signup_screen.dart';
import 'package:furni_move/view/features/registration/views/welcome_screen.dart';
import 'package:furni_move/view/features/splash_screen.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/add_truck/add_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/create_offer/create_offer_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/end_move/end_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_appliances/get_appliances_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_truck/get_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/start_move/start_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck/update_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck_location/update_truck_location_cubit.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo_impl.dart';

void main() {
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AddTruckCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => EndMoveCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => StartMoveCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => GetAppliancesCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => GetTruckCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) =>
              UpdateTruckLocationCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => CreateOfferCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => UpdateTruckCubit(ServiceProviderRepoImpl())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        Routes.splashRoute: (context) => const SplashScreen(),
        Routes.welcomeRoute: (context) => const WelcomeScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
        Routes.signUpRoute: (context) => const SignUpScreen(),
        Routes.baseRoute: (context) => const BaseScreen(),
        Routes.editProfile: (context) => const EditProfileScreen(),
        Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        Routes.providerRequestDetailsRoute: (context) =>
            const RequestDetailsScreen(),
        Routes.providerRequestMapRoute: (context) => const RequestMapScreen(),
        Routes.customerMapLocationRoute: (context) => const MapLocation(),

        // Routes.homeRoute: (context) => const HomeScreen(),
        // Routes.clientActivityRoute: (context) => const ClientActivityScreen(),
        // Routes.clientAccountRoute: (context) => const ClientAccountScreen(),
        // Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        // Routes.adminEndUsersRoute: (context) => const EndUsersScreen(),
        // Routes.adminReportsRoute: (context) => const ReportsScreen(),
        // Routes.providerAccountRoute: (context) => const ProviderAccountScreen(),
        // Routes.providerActivityRoute: (context) =>
        //     const ProviderActivityScreen(),
        // Routes.providerRequestsRoute: (context) => const RequestsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
    );
  }
}

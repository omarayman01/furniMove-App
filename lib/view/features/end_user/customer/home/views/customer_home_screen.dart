import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/end_user/customer/home/views/map_location_screen.dart';
import 'package:furni_move/view/features/end_user/customer/home/widgets/cargo_pics_listview.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key, required this.user});
  final UserModel user;
  static const List<String> vehicles = ['Pickup', 'Van', 'Truck'];

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  String? selectedVehicle = CustomerHomeScreen.vehicles.first;
  dynamic selectedDate = DateTime.now();
  var dateFormate = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    LatLng? sourceMarker;
    LatLng? destinationMarker;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: LogoColumn(),
              ),
              SizedBox(height: screenHeight * 0.05),
              InkWell(
                onTap: () async {
                  final dynamic result;
                  result = await Navigator.pushNamed(
                    context,
                    Routes.customerMapLocationRoute,
                  );
                  debugPrint('Firsttt BAck');

                  if (result != null && result is LatLng) {
                    setState(() {
                      sourceMarker = result;
                    });
                    debugPrint(sourceMarker.toString());
                  } else if (result == null) {}
                },
                child: Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.068,
                  decoration: BoxDecoration(
                    color:
                        AppTheme.lightGrey.withOpacity(0.15), // Divider color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'Pickup Location',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppTheme.blackText,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              InkWell(
                onTap: () async {
                  final dynamic result;
                  result = await Navigator.pushNamed(
                    context,
                    Routes.customerMapLocationRoute,
                  );
                  debugPrint('Firsttt BAck');

                  if (result != null && result is LatLng) {
                    setState(() {
                      destinationMarker = result;
                    });
                    debugPrint(destinationMarker.toString());
                  } else if (result == null) {}
                },
                child: Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.068,
                  decoration: BoxDecoration(
                    color:
                        AppTheme.lightGrey.withOpacity(0.15), // Divider color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'Destination',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppTheme.blackText,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.only(right: 10, left: 20),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vehicle Type',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 15),
                      )),
                  Container(
                    width: screenWidth * 0.51,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.068,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey.withOpacity(0.15), // Divider color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(8),
                    dropdownColor: AppTheme.white,
                    value: selectedVehicle,
                    items: CustomerHomeScreen.vehicles
                        .map((vehicle) => DropdownMenuItem(
                              value: vehicle,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  vehicle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppTheme.blackText,
                                      ),
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedVehicle = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.only(right: 10, left: 20),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Number of appliances',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 15),
                      )),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.11,
                child: const CustomTextFormField(
                  radius: 8,
                  hintText: '0',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.only(right: 10, left: 20),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pickup Date',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 15),
                      )),
                  Container(
                    width: screenWidth * 0.51,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () async {
                  selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      initialDate: selectedDate,
                      initialEntryMode: DatePickerEntryMode.calendarOnly);
                  setState(() {});
                },
                child: Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.068,
                  decoration: BoxDecoration(
                    color:
                        AppTheme.lightGrey.withOpacity(0.15), // Divider color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      dateFormate.format(selectedDate),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.blackText, fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.only(right: 10, left: 20),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Picture of your cargo',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 15),
                      )),
                  Container(
                    width: screenWidth * 0.33,
                    height: screenHeight * 0.003,
                    color: AppTheme.dividerGrey, // Divider color
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.018,
              ),
              SizedBox(
                height: screenHeight * 0.11,
                width: screenWidth * 0.83,
                child: const CargoPicsListView(),
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomButton(
                  onPressed: () {},
                  fontsize: 15,
                  text: 'Create Request',
                  color: AppTheme.primarylight,
                  radius: 20,
                  height: screenHeight * 0.065,
                  width: screenWidth * 0.5,
                  textColor: AppTheme.white)
            ],
          ),
        ),
      ),
    );
  }
}

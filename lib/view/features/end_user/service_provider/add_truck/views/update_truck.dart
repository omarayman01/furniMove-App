import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck/update_truck_cubit.dart';

class UpdateTruck extends StatefulWidget {
  const UpdateTruck({super.key, required this.truck});
  final TruckModel truck;
  @override
  State<UpdateTruck> createState() => _UpdateTruckState();
}

class _UpdateTruckState extends State<UpdateTruck> {
  var plateNumberController = TextEditingController();
  var brandController = TextEditingController();
  var modelController = TextEditingController();
  var yearController = TextEditingController();
  var typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: CustomTextFormField(
                    radius: 10,
                    labelText: 'plateNumber',
                    hintText: widget.truck.plateNumber,
                    controller: plateNumberController,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: CustomTextFormField(
                    radius: 10,
                    labelText: 'brand',
                    controller: brandController,
                    hintText: widget.truck.brand,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: CustomTextFormField(
                    radius: 10,
                    labelText: 'model',
                    controller: modelController,
                    hintText: widget.truck.model,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: CustomTextFormField(
                    radius: 10,
                    labelText: 'year',
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    hintText: widget.truck.year.toString(),
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: CustomTextFormField(
                    radius: 10,
                    labelText: 'type',
                    controller: typeController,
                    hintText: widget.truck.type,
                  ),
                ),
                const SizedBox(height: 10),
                BlocListener<UpdateTruckCubit, UpdateTruckState>(
                  listener: (context, state) {
                    if (state is UpdateTruckLoading) {
                      Fluttertoast.showToast(
                        msg: 'Loading.',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    } else if (state is UpdateTruckSuccess) {
                      Fluttertoast.showToast(
                        msg: 'Truck Updated Successfuly.',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    } else if (state is UpdateTruckFailure) {
                      Fluttertoast.showToast(
                        msg: 'Error!.',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          onPressed: () {
                            context.read<UpdateTruckCubit>().updateTruck(user, {
                              "plateNumber":
                                  plateNumberController.text.toString(),
                              "brand": brandController.text.toString(),
                              "model": modelController.text.toString(),
                              "year": yearController.text.toString(),
                              "type": typeController.text.toString()
                            });
                            setState(() {
                              plateNumberController.clear();
                              brandController.clear();
                              modelController.clear();
                              yearController.clear();
                              typeController.clear();
                            });
                          },
                          text: 'Update Truck',
                          color: AppTheme.primarylight,
                          radius: 20,
                          height: 50,
                          width: 140,
                          fontsize: 14,
                          textColor: AppTheme.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

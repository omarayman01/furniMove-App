import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';

class AddTruckScreen extends StatelessWidget {
  const AddTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truck'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SizedBox(
              height: 90,
              width: 350,
              child: const CustomTextFormField(
                radius: 10,
                labelText: 'plateNumber',
              ),
            ),
            SizedBox(
              height: 90,
              width: 350,
              child: const CustomTextFormField(
                radius: 10,
                labelText: 'brand',
              ),
            ),
            SizedBox(
              height: 90,
              width: 350,
              child: const CustomTextFormField(
                radius: 10,
                labelText: 'model',
              ),
            ),
            SizedBox(
              height: 90,
              width: 350,
              child: const CustomTextFormField(
                radius: 10,
                labelText: 'year',
              ),
            ),
            Spacer(),
            CustomButton(
                text: 'Add Truck',
                color: AppTheme.primarylight,
                radius: 20,
                height: 50,
                width: 200,
                textColor: AppTheme.white),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

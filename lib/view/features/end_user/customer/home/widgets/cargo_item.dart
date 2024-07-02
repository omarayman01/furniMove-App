import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class CargoItem extends StatelessWidget {
  const CargoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.lightGrey,
      elevation: 4, // Adjust the elevation to give a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Rounded corners
      ),
      child: SizedBox(
        width: 50,
        child: Center(
            child: Icon(
          Icons.add,
          color: AppTheme.white,
        )),
      ),
    );
  }
}

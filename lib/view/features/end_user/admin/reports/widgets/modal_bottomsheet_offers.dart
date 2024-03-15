import 'package:flutter/material.dart';

class ModalBottomSheetOffers extends StatelessWidget {
  const ModalBottomSheetOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Text(
            'Offers',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 24),
          )
        ],
      ),
    );
  }
}

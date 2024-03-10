import 'package:flutter/material.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: LogoColumn(),
          )
        ],
      ),
    );
  }
}

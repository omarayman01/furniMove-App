import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';

class ProviderActivityScreen extends StatelessWidget {
  const ProviderActivityScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
    );
  }
}

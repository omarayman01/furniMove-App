import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RequestMapScreen extends StatefulWidget {
  const RequestMapScreen({super.key});

  @override
  State<RequestMapScreen> createState() => _RequestMapScreenState();
}

class _RequestMapScreenState extends State<RequestMapScreen> {
  static const googlePlex = LatLng(37.4223, -122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Move Location'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: googlePlex,
          zoom: 13.5,
        ),
      ),
    );
  }
}

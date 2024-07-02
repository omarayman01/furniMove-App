// import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/end_move/end_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/start_move/start_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck_location/update_truck_location_cubit.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestMapScreen extends StatefulWidget {
  const RequestMapScreen({
    super.key,
    this.request,
  });
  final RequestModel? request;

  @override
  State<RequestMapScreen> createState() => _RequestMapScreenState();
}

class _RequestMapScreenState extends State<RequestMapScreen> {
  Map<PolylineId, Polyline> polylines = {};
  LatLng? currentPosition;
  final locationController = Location();

  // LatLng? sourceLocation = null;
  // LatLng? destinationLocation = null;
  // widget,re

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // print(sourceLocation.toString());
      // print(destinationLocation.toString());

      await initMap();
    });
    super.initState();
  }

  Future<void> initMap() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates, Colors.blueAccent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Move Location'),
      ),
      body: currentPosition == null
          //  && widget.request == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.request!.startLocation!.latitude!,
                        widget.request!.startLocation!.longitude!),
                    zoom: 10,
                  ),
                  markers: {
                    Marker(
                        markerId: const MarkerId('currentLocation'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: currentPosition!),
                    Marker(
                        markerId: const MarkerId('SourceLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(
                            widget.request!.startLocation!.latitude!,
                            widget.request!.startLocation!.longitude!)),
                    Marker(
                        markerId: const MarkerId('DestinationLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(widget.request!.endLocation!.latitude!,
                            widget.request!.endLocation!.longitude!))
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                ),
                Positioned(
                  bottom: 20,
                  right: 60,
                  child: Column(
                    children: [
                      Text(
                        'Destination',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueAccent),
                        child: IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  'google.navigation:q=${widget.request!.endLocation!.latitude!},${widget.request!.endLocation!.longitude!}'));
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.navigation_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Column(
                    children: [
                      Text(
                        'Source',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueAccent),
                        child: IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  'google.navigation:q=${widget.request!.startLocation!.latitude!},${widget.request!.startLocation!.latitude!}'));
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.navigation_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      if (widget.request!.status == 'Waiting') {
                        context
                            .read<StartMoveCubit>()
                            .startMove(user, widget.request!.id!);
                        print(widget.request!.status);
                        Navigator.pop(context);
                      } else if (widget.request!.status == 'Ongoing') {
                        context
                            .read<EndMoveCubit>()
                            .endMove(user, widget.request!.id!);
                        print(widget.request!.status);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        color: widget.request!.status == "Waiting"
                            ? AppTheme
                                .green // AppTheme.primarylight can be replaced with Colors.blue
                            : widget.request!.status == "Ongoing"
                                ? AppTheme.red
                                : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          widget.request!.status == "Waiting" ? 'Start' : 'End',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppTheme.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        // context.read<UpdateTruckLocationCubit>().updateTruckLocation(user, {
        //   "latitude": currentPosition!.latitude,
        //   "longitude": currentPosition!.longitude,
        // });
        print(currentPosition);
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    PolylineRequest request = PolylineRequest(
      origin: PointLatLng(widget.request!.startLocation!.latitude!,
          widget.request!.startLocation!.longitude!),
      destination: PointLatLng(widget.request!.endLocation!.latitude!,
          widget.request!.endLocation!.longitude!),
      mode: TravelMode.driving,
    );

    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: request,
      googleApiKey: EndPoints.googleApiKey,
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates, Color color) async {
    const id = PolylineId('polyline');
    final polyline = Polyline(
        polylineId: id, color: color, points: polylineCoordinates, width: 5);
    setState(() {
      polylines[id] = polyline;
    });
  }
}

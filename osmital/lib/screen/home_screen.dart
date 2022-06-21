import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for center of map
  final MapController mapController = MapController();

  // position for lat and lng
  Position? position;

  // get Location Permission function ask for permission to access location data from the device
  getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  // get current location function get the current location of the device
  getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      position = newPosition;
      mapController.move(LatLng(position!.latitude, position!.longitude), 15);
    });

    // log is use only for printing in debuging mode.
    log("position: ${position.toString()}");
  }

  @override
  void initState() {
    getLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentLocation();
        },
        child: const Icon(Icons.my_location_outlined),
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(
            position?.latitude ?? 26,
            position?.longitude ?? 84,
          ),
          zoom: 5.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  position?.latitude ?? 26,
                  position?.longitude ?? 84,
                ),
                builder: (ctx) => const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

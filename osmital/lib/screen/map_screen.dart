import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osmital/provider/osmital_data_provider.dart';
import 'package:osmital/widget/bottom_modal_sheet.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

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

class _MapPageState extends State<MapPage> {
  // position for lat and lng
  Position? position;
  final MapController mapController = MapController();

  // get Location Permission function ask for permission to access location data from the device

  // get current location function get the current location of the device
  getCurrentLocation() async {
    // ignore: non_constant_identifier_names
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      position = newPosition;
      mapController.move(LatLng(position!.latitude, position!.longitude), 16);
    });

    // log is use only for printing in debuging mode.
    // log("position: ${position.toString()}");
  }

  @override
  void initState() {
    getLocationPermission();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Provider.of<OsmitalData>(context, listen: false).getOsmitalData();
        //   },
        //   child: const Icon(
        //     Icons.my_location_outlined,
        //     color: Colors.blue,
        //   ),
        // ),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: LatLng(position?.latitude ?? 27, position?.longitude ?? 84),
            zoom: 5.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                    position?.latitude ?? 27,
                    position?.longitude ?? 54,
                  ),
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

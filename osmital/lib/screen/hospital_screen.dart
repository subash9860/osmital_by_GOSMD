import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../provider/osmital_data_provider.dart';
import '../widget/user_icon.dart';
import '../provider/location_permision.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  Position? position;
  final MapController _mapController = MapController();

  @override
  void initState() {
    // Provider.of<OsmitalData>(context, listen: false).getOsmitalData();

    Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      setState(() {
        position = value;
        _mapController.move(
            LatLng(position!.latitude, position!.longitude), 16);
        // Provider.of<OsmitalData>(context, listen: false)
        //     .postOsmitalData(27.14, 85.34);
      });
    });

    // log('${Provider.of<OsmitalData>(context, listen: false).items[0].lat.toString()}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final Osmital os =
    // Provider.of<OsmitalData>(context, listen: false).items[0];

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     Provider.of<LocationProvider>(context, listen: false)
      //         .getCurrentLocation()
      //         .then((value) {
      //       setState(() {
      //         position = value;
      //         _mapController.move(
      //             LatLng(position!.latitude, position!.longitude), 16);
      //       });
      //     });
      //   },
      //   child: const Icon(Icons.my_location),
      // ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center:
                  LatLng(position?.latitude ?? 27, position?.longitude ?? 84),
              zoom: 10.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: LatLng(
                      position?.latitude ?? 27,
                      position?.longitude ?? 84,
                    ),
                    builder: (context) => const UserIcon(),
                  ),
                  Marker(
                    point: LatLng(43, 44),
                    builder: (context) => Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // TODO: add marker for hospital
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osmital/provider/location_permision.dart';
import 'package:osmital/provider/osmital_data_provider.dart';
// import '../provider/osmital_data_provider.dart';
// import 'package:osmital/widget/bottom_modal_sheet.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // position for lat and lng
  Position? position;
  final MapController _mapController = MapController();

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      setState(() {
        position = value;
        _mapController.move(
            LatLng(position!.latitude, position!.longitude), 16);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterMap(
          mapController: _mapController,
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
